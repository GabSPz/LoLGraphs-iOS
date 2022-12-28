//
//  Constant.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 28/12/22.
//

import Foundation

class Constant {
    static let isMock = true
    static let champListMock = """
    {
    "data":{
        "Ahri":{
            "id": "Ahri",
            "name": "Ahri"
        }
    }
    """.data(using: .utf8)!
}
