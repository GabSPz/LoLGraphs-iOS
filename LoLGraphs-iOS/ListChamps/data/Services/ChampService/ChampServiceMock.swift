//
//  ChampServiceMock.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 23/12/22.
//

import Foundation
class ChampServiceMock: ChampServiceProtocol{
    func getListChamps(completion: @escaping (ChampListModelResponse?) -> Void) {
        var champList = try? JSONDecoder().decode(ChampListModelResponse.self, from: Constant.champListMock)
        completion(champList)
    }
    
    func getOneChamp(id: String, completion: @escaping (ChampDetailListResponse?) -> Void) {
        completion(ChampDetailListResponse(type: "", format: "", version: "", data: ["Ahri" : ChampDetailResponse(id: "Ahri", name: "Ahri", lore: "Lore ahri no mames", skins: [])]))
    }
    
    
}
