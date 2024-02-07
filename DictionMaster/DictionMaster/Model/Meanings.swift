//
//  Meanings.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Meanings: Codable {
    let partOfSpeech: String?
    let definitions: [Definitions]
    let synonyms, antonyms: [String]?
}

extension Meanings: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definitions)
        hasher.combine(synonyms)
        hasher.combine(antonyms)
    }
    
    static func == (lhs: Meanings, rhs: Meanings) -> Bool {
        return lhs.partOfSpeech == rhs.partOfSpeech &&
            lhs.definitions == rhs.definitions &&
            lhs.synonyms == rhs.synonyms &&
            lhs.antonyms == rhs.antonyms
    }
}
