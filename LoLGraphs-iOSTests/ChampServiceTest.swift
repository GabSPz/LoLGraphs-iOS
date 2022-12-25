//
//  ChampServiceTest.swift
//  LoLGraphs-iOSTests
//
//  Created by Gabriel Sanchez Peraza on 22/12/22.
//

import XCTest
@testable import LoLGraphs_iOS

final class ChampServiceTest: XCTestCase {

    var champService: ChampService!
    var champViewModel: ListChampsViewModel!
    override func setUpWithError() throws {
        champService = ChampService()
        champViewModel = ListChampsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_GetChampList_onApperInListChampView() {
        let expected = ["Test": ChampModelResponse(id: "TestId", nameChamp: "Test")]
        let result = champService.getListChamps { champ in
            
        }

        
        
        let champTest: ChampListModelResponse = ChampListModelResponse(champDictionary: ["Test": ChampModelResponse(id: "TestId", nameChamp: "Test")] )
        
    }

    
    

}
