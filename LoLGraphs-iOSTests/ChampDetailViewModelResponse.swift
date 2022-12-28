//
//  ChampDetailViewModelResponse.swift
//  LoLGraphs-iOSTests
//
//  Created by Gabriel Sanchez Peraza on 28/12/22.
//

import XCTest
@testable import LoLGraphs_iOS

final class ChampDetailViewModelTest: XCTestCase {

    var champService: ChampServiceProtocol!
    var champViewModel: ChampDetailViewModel!
    
    override func setUpWithError() throws {
        champService = ChampServiceMock()
        champViewModel = ChampDetailViewModel(champService: champService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_GetOneChamp_onApperInChampDetailViewWhenChampSelectedFromListChampView(){
        champViewModel.getChamp(id: "")
        var champ = champViewModel.model
        XCTAssert(champ.name == "Ahri" && champ.skins.isEmpty)
    }

}
