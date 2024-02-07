//
//  DictionaryMeaningsViewModel.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

final class DictionaryMeaningsViewModel: ObservableObject {
    private let service = APIService()
    
    @Published var meanings: [Meanings] = []
    @Published var phonetics: [Phonetics] = []
    
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
        service.getWordMeanings(for: word) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let models):
                    self?.meanings = models
                case .failure:
                    break
                }
            }
        }
    }
}
