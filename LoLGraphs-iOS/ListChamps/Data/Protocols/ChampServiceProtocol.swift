//
//  ChampServiceProtocol.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 23/12/22.
//

import Foundation

protocol ChampServiceProtocol: AnyObject{
    func getListChamps(completion: @escaping (ChampListModelResponse?) -> Void)
    func getOneChamp(id: String, completion: @escaping (ChampDetailListResponse?) -> Void)
}
