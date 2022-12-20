//
//  ChampListModelResponse.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 14/12/22.
//
import Foundation
struct ChampListModelResponse:Decodable {
    let champDictionary: Dictionary<String, ChampModelResponse>
    enum CodingKeys: String, CodingKey {
        case champDictionary = "data"
    }
}

struct ChampModelResponse:Decodable {
    let id: String
    let nameChamp: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameChamp = "name"
    }
}
