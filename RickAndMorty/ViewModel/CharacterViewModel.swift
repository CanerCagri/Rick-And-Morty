//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation
import Kingfisher
import UIKit

class CharacterViewModel : CharacterViewModelProtocol {
    var delegate: CharacterViewModelDelegate?
    let service = Service()
    
    var characters : [Character] = []
    
    func loadData() {
        service.getData { [weak self] character in
            self?.delegate?.handleViewModelOutput(character!)
            
        }
    }
    
    func heightRowAt() -> CGFloat {
        return 150
    }
    
    func numberOfRowsInSection() -> Int {
        return characters.count
    }
    
    func kingFisherTools() -> (String, DownsamplingImageProcessor) {
        let url =  "https://i3.wp.com/simpleandseasonal.com/wp-content/uploads/2018/02/Crockpot-Express-E6-Error-Code.png"
        let processor = DownsamplingImageProcessor(size: CGSize(width: 100, height: 130))

        func kingFisherUrl() -> String {
            return url
        }
       
        func kingFisherProcessor() -> DownsamplingImageProcessor {
            
            return processor
        }
        return (url, processor)
    }
}
