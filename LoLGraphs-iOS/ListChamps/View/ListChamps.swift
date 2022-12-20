//
//  ListChamps.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 13/12/22.
//

import SwiftUI

struct ListChamps: View {
    @StateObject var viewModel = ListChampsViewModel()
    @State var searchText = ""
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.filter, id: \.id) { champ in
                    NavigationLink(destination: {
                        ChampDetail(id: champ.nameChamp)
                    }, label: {
                        HStack {
                            AsyncImage(url: URL(string: "http://ddragon.leagueoflegends.com/cdn/12.12.1/img/champion/\(champ.nameChamp).png"))
                            
                                .fixedSize()
                                .cornerRadius(30, corners: .bottomRight)
                            
                            Text(champ.nameChamp)
                                .font(.headline)
                        }
                        .frame(maxHeight: 70)
                        .padding(.vertical)
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
