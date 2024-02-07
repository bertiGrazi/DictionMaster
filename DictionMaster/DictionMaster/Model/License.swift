//
//  License.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 07/02/24.
//

import Foundation

struct License: Codable {
    let name: String?
    let url: String?
}

extension License: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
    static func == (lhs: License, rhs: License) -> Bool {
        return lhs.name == rhs.name &&
            lhs.url == rhs.url
    }
}
