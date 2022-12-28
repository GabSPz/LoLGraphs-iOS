//
//  ChampDetailModel.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 15/12/22.
//

import SwiftUI


struct ChampDetailModel {
    var id: String
    var name: String
    var lore: String
    var skins: [Skins]
    
    static let empty: Self = .init(id: "0", name: "S/N", lore: "N", skins: [])
}

struct Skins {
    var skinId: String
    var num: Int
    var skinName: String
    var image: UIImage?
    var url: URL?
}


