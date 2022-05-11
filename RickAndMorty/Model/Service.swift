//
//  Service.swift
//  RickAndMorty
//
//  Created by Caner Çağrı on 11.05.2022.
//

import Foundation
import UIKit

class Service {
    
    func getData(completion: @escaping ([Character]?) -> ()) {
        let url = URL(string: "https://rickandmortyapi.com/api/character?page=5")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil)
                fatalError(error.localizedDescription)
                
            } else if let data = data {
                let session = try? JSONDecoder().decode(CharacterList.self, from: data)
                
                if let session = session {
                    completion(session.results)
                }
            }
            
        }.resume()
    }
    
}
