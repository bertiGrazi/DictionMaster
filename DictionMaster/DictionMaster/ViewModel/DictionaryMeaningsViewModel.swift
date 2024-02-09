//
//  DictionaryMeaningsViewModel.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

final class DictionaryMeaningsViewModel: ObservableObject {
    private let service = APIService()
    private let manager = LocalFileManager.instance
    
    @Published var meanings: [Meanings] = []
    @Published var phonetics: [Phonetics] = []
    @Published var remainingSearches: Int = 5
    
    private let userDefaults = UserDefaults.standard
    private let currentDateKey = "currentDate"
    private let searchesMadeKey = "searchesMade"
    
    init() {
        checkRemainingSearches()
    }
    
    private func checkRemainingSearches() {
        if let lastCheckDate = userDefaults.object(forKey: currentDateKey) as? Date,
           Calendar.current.isDateInToday(lastCheckDate) {

            remainingSearches = 5
        } else {
            userDefaults.set(Date(), forKey: currentDateKey)
        }

        
        let searchesMade = userDefaults.integer(forKey: searchesMadeKey)
        remainingSearches -= searchesMade
    }
    
    private func incrementSearchesMade() {
        let searchesMade = userDefaults.integer(forKey: searchesMadeKey) + 1
        userDefaults.set(searchesMade, forKey: searchesMadeKey)
    }

    public func getWordPhonetics(for word: String) {
        service.getWordPhonetics(for: word) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let models):
                    self?.phonetics = models
                case .failure:
                    break
                }
            }
        }
    }
    
    public func fetchMeanings(for word: String) {
        if let cachedResult = manager.loadResultsFromCache(for: word) {
            if let combinedData = cachedResult.joined().data(using: .utf8) {
                do {
                    let decoder = JSONDecoder()
                    let dictionaryResponse = try decoder.decode(DictionaryResponse.self, from: combinedData)
                    meanings = dictionaryResponse.meanings ?? []
                } catch {
                    print("Error decoding cached meanings for word '\(word)': \(error)")
                }
            } else {
                print("Error converting cached data to Data for word '\(word)'")
            }
        } else {
            if remainingSearches > 0 {
                service.getWordMeanings(for: word) { [weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let models):
                            self?.meanings = models

                            do {
                                let encoder = JSONEncoder()
                                let meaningsData = try encoder.encode(models)
                                let meaningsString = String(data: meaningsData, encoding: .utf8) ?? ""
                                self?.manager.saveResultsFromCache([meaningsString], for: word)
                            } catch {
                                print("Error saving meanings to cache for word '\(word)': \(error)")
                            }
                            
                            self?.remainingSearches -= 1
                            print("Successfully fetched and cached meanings for word '\(word)'")
                        case .failure(let error):
                            print("Error fetching meanings for word '\(word)': \(error)")
                        }
                    }
                }
            } else {
                print("Remaining searches exhausted for word '\(word)'.")
            }
        }
    }
}
