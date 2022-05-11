//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation
import UIKit

struct CharacterList: Decodable {
    var results = [Character] ()
}

struct Character: Decodable {
    let name: String?
    let species: String?
    let gender: String?
    let image: String?
}
