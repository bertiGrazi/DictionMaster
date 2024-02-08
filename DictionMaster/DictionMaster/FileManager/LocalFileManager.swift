//
//  LocalFileManager.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 08/02/24.
//

import Foundation

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func loadResultsFromCache(for word: String) -> [String]? {
        guard let cacheURL = getPathForChacheURL(word: word),
              let data = try? Data(contentsOf: cacheURL),
              let cachedResults = String(data: data, encoding: .utf8)?.components(separatedBy: ",") else {
            return nil
        }
        
        return cachedResults
    }

    
    func saveResultsFromCache(_ allResults: [String], for word: String) {
        let joinResults = allResults.joined(separator: ",")
        guard
            let data = joinResults.data(using: .utf8),
            let path = getPathForChacheURL(word: word) else {
            print("Error getting data.")
            return
        }
        
        do {
            try data.write(to: path)
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
    func getPathForChacheURL(word: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathExtension("\(word)") else {
            return nil
        }
        
        return path
    }
}
