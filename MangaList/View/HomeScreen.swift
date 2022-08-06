//
//  HomeScreen.swift
//  MangaList
//
//  Created by Hoang, Ho Duy on 01/08/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    // Current tab
    @State var currentTab: Tab = .Home
    
    // Hiding others tab
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    // Matched Geotery effect
    @Namespace var animation
    
    // Current Tab XValue
//    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        TabView(selection: $currentTab)
        {
//            SampleCards(color: .purple, count: 20)
            Text("Home")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background().ignoresSafeArea()
                .tag(Tab.Home)
                        
            Text("About Us")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background().ignoresSafeArea()
                .tag(Tab.About)
//
        }
        // Curved Tab Bar
        .overlay(
            
            HStack(spacing:0){
                ForEach(Tab.allCases, id: \.rawValue){
                    tab in
                        TabButton(tab: tab)
                }
            }
            .padding(.vertical)
            .padding(.bottom,getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
            .background(
                MaterialEffect(style: .systemUltraThinMaterialDark))
////                    .clipShape(BottomCurve(currentXValue: currentXValue))
            ,alignment: .bottom
        )
            
        
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func SampleCards(color: Color, count: Int) -> some View{
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(1...count, id: \.self){index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(height:250)
                    }
                }
                .padding()
                .padding(.bottom, 60)
                .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            }
            .navigationTitle("Home")
        }
    }
    
    // Tab button
    @ViewBuilder
    func TabButton(tab: Tab)->some View{
        
//        Button {
//            withAnimation(.spring()){
//                currentTab=tab
//
////                    currentXValue = proxy.frame(in: .global).midX
//            }
//        } label: {
//            Image(systemName: tab.rawValue)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 25, height: 33)
//                .frame(maxWidth: .infinity)
//                .foregroundColor(.white)
//                .padding(currentTab == tab ? 15 : 0)
//                .background(
//                    ZStack{
//                        if currentTab == tab {
//
//                            MaterialEffect(style:
//                                .systemChromeMaterial)
//                                .clipShape(Circle())
////                                    .matchedGeometryEffect(id: "TAB", in: animation)
//                        }
//                    }
//                )
//                .contentShape(Rectangle())
//                .offset(y: currentTab == tab ? -50 : 0)
//
//        }
        
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()){
                    currentTab=tab

//                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                Image(systemName: tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 33)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        ZStack{
                            if currentTab == tab {

                                MaterialEffect(style:
                                    .systemChromeMaterial)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)

            }
            // Setting initial curve position
//            .onAppear{
//                if tab == Tab.allCases.first && currentXValue == 0 {
//                    currentXValue = proxy.frame(in: .global).midX
//                }
//            }
        }
        .frame(height: 30)
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


// Enum for tab
enum Tab:String, CaseIterable{
    case Home = "house.fill"
    case About = "person.fill"
//    case Cart = "magnifyingglass.fill"
//    case Noti = "bell.fill"
}

extension View{
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets
        else {
            return .zero
        }
        return safeArea
    }
}

