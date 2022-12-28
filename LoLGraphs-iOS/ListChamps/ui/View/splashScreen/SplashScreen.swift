//
//  SplashScreen.swift
//  LoLGraphs-iOS
//
//  Created by Gabriel Sanchez Peraza on 26/12/22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isActive = true
    var body: some View {
        if isActive{
            VStack {
                VStack{
                    
                    image
                    Text("LoLGraphs")
                        .font(.title)
                        .foregroundColor(.black.opacity(0.8))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = false

                }
            }
            
        } else {
            ListChamps()
        }
    }
    var image: some View {
        Image("splash")
            .resizable()
            .frame(maxWidth: 250, maxHeight: 250)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
