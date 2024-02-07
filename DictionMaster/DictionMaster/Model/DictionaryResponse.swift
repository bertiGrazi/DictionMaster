//
//  DictionaryResponse.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct DictionaryResponse: Codable {
    let word: String?
    let phonetics: [Phonetics]?
    let meanings: [Meanings]?
    let license: License?
    let sourceUrls: [String]?
}




