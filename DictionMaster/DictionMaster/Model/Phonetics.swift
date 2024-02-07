//
//  PhoneticsModel.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Phonetics: Codable {
    let text: String?
    let audio: String?
    let sourceURL: String?
    let license: License?
}

extension Phonetics: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(audio)
        hasher.combine(sourceURL)
        hasher.combine(license)
    }
    
    static func == (lhs: Phonetics, rhs: Phonetics) -> Bool {
        return lhs.text == rhs.text &&
        lhs.audio == rhs.audio &&
        lhs.sourceURL == rhs.sourceURL &&
        lhs.license == rhs.license
    }
}
