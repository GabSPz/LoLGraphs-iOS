//
//  ChampDetailViewModel.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 15/12/22.
//

import Foundation

class ChampDetailViewModel: ObservableObject {
    @Published var model: ChampDetailModel = ChampDetailModel.empty
    private var champService: ChampServiceProtocol
    
    init( champService: ChampServiceProtocol) {
        self.champService = champService
    }
    
    func getChamp(id: String) {
        
        champService.getOneChamp(id: id) { champResponse in
            
            if let champ = champResponse?.data.values.first{
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
            }
        }
    }
}

extension ChampDetailViewModel {
    static func build()-> ChampDetailViewModel{
        return ChampDetailViewModel(champService: Constant.isMock ? ChampServiceMock() : ChampService())
    }
}
