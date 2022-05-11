//
//  Service.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation
import UIKit
import Alamofire

class Service {
    
    func getData(completion: @escaping ([Character]?) -> ()) {
        let url = URL(string: "https://rickandmortyapi.com/api/character?page=5")!
        
        AF.request(url).responseDecodable(of: (CharacterList).self ) { (model) in
            
            if let sessionAF = model.value {
                completion(sessionAF.results)
                
            }
        }
    }
}
