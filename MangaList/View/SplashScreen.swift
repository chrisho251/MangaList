//
//  SplashScreen.swift
//  MangaList
//
//  Created by Hoang, Ho Duy on 01/08/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack{
                    Spacer()
                    Image("splash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                    Text("Manga World")
                        .font(Font.custom("Baskerville-Bold", size:26))
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2))
                    {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    withAnimation{self.isActive=true}
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()    }
}
