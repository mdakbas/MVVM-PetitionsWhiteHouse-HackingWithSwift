//
//  Petition.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import Foundation

struct Petition: Codable {
    var results: [PetitionResults]?
}

struct PetitionResults: Codable {
    var title: String?
    var body: String?
    var signatureCount: Int?
}
