//
//  ChampDetailResponse.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 15/12/22.
//

import Foundation

struct ChampDetailListResponse: Decodable {
    let type, format, version: String
    let data: [String: ChampDetailResponse]
}

struct ChampDetailResponse: Decodable {
    var id: String
    var name: String
    var lore: String
    var skins: [SkinsResponse]
}

struct SkinsResponse: Decodable {
    var id: String
    var num: Int
    var name: String
}


