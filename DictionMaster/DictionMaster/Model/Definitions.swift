//
//  Definition.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Definitions: Codable, Hashable {
    let definition: String?
    let synonyms, antonyms: [String]?
    let example: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(definition)
        hasher.combine(synonyms)
        hasher.combine(antonyms)
        hasher.combine(example)
    }
    
    static func == (lhs: Definitions, rhs: Definitions) -> Bool {
        return lhs.definition == rhs.definition &&
            lhs.synonyms == rhs.synonyms &&
            lhs.antonyms == rhs.antonyms &&
            lhs.example == rhs.example
    }
}
