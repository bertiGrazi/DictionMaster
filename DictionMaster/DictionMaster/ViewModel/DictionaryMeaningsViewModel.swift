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
            let meaningsFromCache = cachedResult.compactMap { meaningsString -> Meanings? in
                guard let data = meaningsString.data(using: .utf8) else {
                    return nil
                }
                
                do {
                    return try JSONDecoder().decode(Meanings.self, from: data)
                } catch {
                    print("Error decoding cached meanings: \(error)")
                    return nil
                }
            }
            meanings = meaningsFromCache
        } else {
            if remainingSearches > 0 {
                service.getWordMeanings(for: word) { [weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let models):
                            self?.meanings = models
                            
                            let meaningsStrings = models.map { try? JSONEncoder().encode($0) }
                            let meaningsStringsNotNil = meaningsStrings.compactMap { $0 }
                            let meaningsStringsText = meaningsStringsNotNil.map { String(data: $0, encoding: .utf8) ?? "" }
                            self?.manager.saveResultsFromCache(meaningsStringsText, for: word)
                            self?.remainingSearches -= 1
                            
                            print("GRAAAZIIIII \(word)")
                           
                            
                        case .failure:
                            break
                        }
                    }
                }
            }
        }
    }
}
