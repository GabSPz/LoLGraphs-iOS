//
//  ChampServiceTest.swift
//  LoLGraphs-iOSTests
//
//  Created by Gabriel Sanchez Peraza on 22/12/22.
//

import XCTest
@testable import LoLGraphs_iOS

final class ListChampsViewModelTest: XCTestCase {

    var champService: ChampServiceProtocol!
    var champViewModel: ListChampsViewModel!
    override func setUpWithError() throws {
        champService = ChampServiceMock()
        champViewModel = ListChampsViewModel(service: champService)
    }

    override func tearDownWithError() throws {
        champService = nil
        champViewModel = nil
    }
    
    func test_GetChampList_onApperInListChampView() {
        champViewModel.getList()
        var list = champViewModel.model
        assert(list.count == 2)
    }
    
    
}
