//
//  Definition.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Definition: Codable {
    let definition: String?
    let synonyms, antonyms: [String]?
    let example: String?
}

