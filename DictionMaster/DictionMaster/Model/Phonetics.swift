//
//  PhoneticsModel.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct Phonetics: Codable {
    let audio: String?
    let sourceURL: String?
    let license: License?
    let text: String?
}
