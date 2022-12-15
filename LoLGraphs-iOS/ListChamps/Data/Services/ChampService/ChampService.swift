//
//  ChampService.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 14/12/22.
//

import Foundation

class ChampService {
    
    func getListChamps(completion: @escaping (ChampListModelResponse?) -> Void) {
        let urlSession = URLSession.shared
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.15.1/data/es_MX/champion.json")
        
        urlSession.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                let champ = try? JSONDecoder().decode(ChampListModelResponse.self, from: data)
                completion(champ)
            }
        }.resume()
    }
}
