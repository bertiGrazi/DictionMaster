//
//  APIService.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

final class APIService {
    init() {}
    
    func getWordMeanings(completion: @escaping(Result<[Meanings], Error>) -> Void) {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/table") else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            guard
                let data = data,
                    error == nil,
                let response = res as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                completion(.failure(error ?? NSError(domain: "YorDomain", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([DictionaryResponse].self, from: data)
                print("Meu response: \(response as Any)")
                for each in response {
                    print("Meu response: \(each)")
                    print("Meu response: \(each.meanings)")
                    print(each)
                    print()
                    completion(.success(each.meanings ?? []))
                }
                
            } catch {
                let json = try? JSONSerialization.jsonObject(with: data)
               print("Erro ao decofificar JSON: ", error)
                if let json = json {
                    print("json inválido: ", json)
                }
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
