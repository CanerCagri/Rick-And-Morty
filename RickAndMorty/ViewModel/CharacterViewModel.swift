//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation

class CharacterViewModel : CharacterViewModelProtocol {
    var delegate: CharacterViewModelDelegate?
    let service = Service()
    
    var characters : [Character] = []
    
    func loadData() {
        service.getData { [weak self] character in
            self?.delegate?.handleViewModelOutput(character!)

        }
    }
}
