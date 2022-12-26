//
//  ListChamps.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 13/12/22.
//

import SwiftUI

protocol ChampIdProtocol {
    func onChampSelectec()
}

struct ListChamps: View {
    @StateObject var viewModel = ListChampsViewModel()
    @State var searchText = ""
    
    var delegate : ChampIdProtocol!
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.filter, id: \.id) { champ in
                    NavigationLink(destination: {
                        ChampDetail(id: champ.nameChamp)
                    }, label: {
                        HStack {
                            AsyncImage(url: URL(string: "http://ddragon.leagueoflegends.com/cdn/12.12.1/img/champion/\(champ.nameChamp).png"))
                                .scaledToFit()
                            
                            Text(champ.nameChamp)
                                .font(.headline)
                        }
                        .frame(maxHeight: 70)
                        .padding(.vertical)
                        .cornerRadius(8)
                    })
                }
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .onAppear{
                viewModel.getList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListChamps()
    }
}
