//
//  ChampDetail.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 15/12/22.
//

import SwiftUI
import QuickLook
struct ChampDetail: View {
    let id: String
    @StateObject private var viewModel = ChampDetailViewModel()
    @State private var isClicking = false
    @State private var skinName = ""
    @State private var zoom = 1.0
    @State private var url: URL?

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView{
                    VStack (spacing: 20){
                        imgChamp
                        loreChamp
                        skinsChamps
                    }
                    .padding()
                }
                if isClicking {
                    VStack {
                        Spacer()
                        skinNameToast
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    nameChamp
                }
            }
        }
        .onAppear{
            viewModel.getChamp(id: id)
        }
      
    }
    var skinNameToast: some View {
        ZStack {
            Rectangle()
                .background(.gray)
                .frame(width: .infinity, height: 30)
                .opacity(0.5)
                .cornerRadius(20)
                .padding(40)
                

            Text(skinName)
                .frame(width: .infinity, height: 30)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
        }
    }
    
    var skinsChamps: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach( viewModel.model.skins, id: \.skinId) { skin in
                    if let image = skin.image{
                        Image(uiImage: image)
                            .onTapGesture {
                                self.url = skin.url
                            }

                    }
                    AsyncImage(url: URL(string:"http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(id)_\(skin.num).jpg")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(zoom)
                            .onTapGesture {
                                skinName = skin.skinName
                                isClicking = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.isClicking = false
                                }
                                
                                
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(maxHeight: 300)
            }
        }

        
    }
    
    var loreChamp: some View {
        VStack {
            Text(viewModel.model.lore)
                .foregroundColor(.white)
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
        .background(.blue)
        .shadow(radius: 10)
        .cornerRadius(30, corners: .bottomRight)
        .cornerRadius(30, corners: .topLeft)

    }
    var imgChamp: some View {
        AsyncImage(url: URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(id)_0.jpg")) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
        } placeholder: {
            ProgressView()
        }
    }
    
    var nameChamp: some View {
        Text(viewModel.model.name)
            .applyFormatTitle()
        
        
    }
}

struct ChampDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChampDetail(id: "Talon")
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
extension View {
    func  applyFormatTitle() -> some View {
        modifier(TitleFormat())
    }
}
struct TitleFormat: ViewModifier{
    func body(content: Content) -> some View {
        HStack  {
            content
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
                .padding(.leading)
            Spacer()
        }
        .frame(width: 400, height: 60)
        .background(.blue)
    }
    
    
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
