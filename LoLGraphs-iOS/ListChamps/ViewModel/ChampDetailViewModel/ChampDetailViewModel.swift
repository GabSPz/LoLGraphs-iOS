//
//  ChampDetailViewModel.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 15/12/22.
//

import Foundation

class ChampDetailViewModel: ObservableObject {
    @Published var model: ChampDetailModel = ChampDetailModel.empty
    let champService = ChampService()
    
    func getChamp(id: String) {
        
        champService.getOneChamp(id: id) { champResponse in
            
            if let champ = champResponse?.data[id] {
                var skinsModel: [Skins] = []
                
                champ.skins.forEach { skinsRes in
                    skinsModel.append(Skins(
                        skinId: skinsRes.id, num: skinsRes.num, skinName: skinsRes.name )
                    )
                }
                self.model = ChampDetailModel(
                    id: champ.id,
                    name: champ.name,
                    lore: champ.lore,
                    skins: skinsModel
                    )
                print(String(describing: self.model.skins))

            }
        }
    }
}
