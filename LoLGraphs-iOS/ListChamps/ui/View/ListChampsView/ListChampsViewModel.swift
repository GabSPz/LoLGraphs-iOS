//
//  ListChampsViewModel.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 13/12/22.
//

import Foundation

class ListChampsViewModel: ObservableObject {
    @Published var model: [ChampModel] = [] {didSet{filter = model}}
    @Published var filter: [ChampModel] = []
    @Published var isLoading: Bool = false
    var service: ChampServiceProtocol
    
    init(service: ChampServiceProtocol) {
        self.service = service
    }
    
    func getList() {
        service.getListChamps { listResponse in
            if let list = listResponse{
                var lisTemp: [ChampModel] = []
                list.champDictionary.forEach { (key: String, value: ChampModelResponse) in
                    lisTemp.append(ChampModel(id: value.id, nameChamp: value.nameChamp))
                }
                lisTemp.sort(by: {$0.nameChamp < $1.nameChamp})
                self.model = lisTemp
            }
            
        }
    }
    
}

extension ListChampsViewModel {
    static func build()-> ListChampsViewModel{
        return ListChampsViewModel(service: Constant.isMock ? ChampServiceMock() : ChampService())
    }
}
