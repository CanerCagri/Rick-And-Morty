//
//  RickAndMortyContracts.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation

protocol CharacterViewModelProtocol {
    var delegate : CharacterViewModelDelegate? { get set }
    func loadData()
}

protocol CharacterViewModelDelegate {
    func handleViewModelOutput (_ output : [Character])
}
