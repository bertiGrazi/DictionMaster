//
//  Meanings.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Meanings: Codable {
    let partOfSpeech: String?
    let definition: [Definition]
    let synonyms, antonyms: [String]?
}
