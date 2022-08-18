//
//  HomeScreen.swift
//  MangaList
//
//  Created by Hoang, Ho Duy on 01/08/2022.
//

import SwiftUI
import CoreLocation


struct HomeScreen: View {
    
    // Current tab
    @State var currentTab: Tab = .Home
    
    
    // Hiding others tab
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    // Matched Geotery effect
    @Namespace var animation
    
    // Declare search variable
    @State private var search: String = ""

    @State private var selectedIndex: Int = 1
    var body: some View {
        TabView(selection: $currentTab)
        {
            HomeCard()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.black)).ignoresSafeArea()
                .tag(Tab.Home)
                        
            Text("About Us")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background().ignoresSafeArea()
                .tag(Tab.About)
        }
        // Tab Bar
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
            ,alignment: .bottom
        )
            
        
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
    }
    
    
    @ViewBuilder
    func About() -> some View {
        NavigationView{
            ZStack{
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                                    .ignoresSafeArea()
                
                ForEach(store, id: \.id) { i in
                    ZStack {
                                        ScrollView{
                                            VStack {
                                                MapView(coordinate: i.locationCoordinate)
                                                    .edgesIgnoringSafeArea(.top)
                                                    .frame(height: 250)
                                                Image("")
                                                    .offset(y: -100)
                                                    .padding(.bottom, -100)
                                                Text(i.name)
                                                    .font(.system(size: 40))
                                                    .bold()
                                                    .foregroundColor(.white)
                    
                    
                                                RoundedRectangle(cornerRadius: 25)
                                                            .fill(Color.white)
                                                            .frame(height: 50.0)
                                                            .overlay(HStack {
                                                                Image(systemName: "envelope.fill")
                                                                    .foregroundColor(Color("envelope.fill"))
                                                                Link(destination: URL(string: "mail to:\(i.email)")!) {
                                                                    Text(i.email)
                                                                        .foregroundColor(.black)
                                                                }
                    
                                                            })
                                                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                                RoundedRectangle(cornerRadius: 25)
                                                            .fill(Color.white)
                                                            .frame(height: 50.0)
                                                            .overlay(HStack {
                                                                Image(systemName: "phone.fill")
                                                                    .foregroundColor(Color("Primary"))
                                                                Link(destination: URL(string: "tel:\(i.phone)")!) {
                                                                    Text(i.phone)
                                                                        .foregroundColor(.black)
                                                                }
                    
                                                            })
                                                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                                                            }
                                        }
                                    }
                    
                }
//
                .navigationTitle("About us")
            }
        }
    }
    
    @ViewBuilder
    func HomeCard() -> some View{
        NavigationView{
            ZStack{
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                                    .ignoresSafeArea()
                ScrollView (showsIndicators: false){
                    VStack(alignment: .leading){
                        
                        // Define tag line view builder
                        TitleView()
                            .padding()
                        
                        SearchBar(search: $search)
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                                                    HStack (spacing: 0) {
                                                        ForEach(pop, id: \.id) { i in
                                                            NavigationLink(
                                                                destination: MangaDetailScreen(pop: i),
                                                                label: {
                                                                    VStack {
                                                                        i.image
                                                                            .resizable()
                                                                            .frame(width: 210, height: 200 * (210/210))
                                                                            .cornerRadius(20.0)
                                                                        Text(i.name).font(.title3).fontWeight(.bold).foregroundColor(Color("Primary"))

                                                                        HStack (spacing: 2) {
                                                                            Text("Rate: " + i.rating)
                                                                            Spacer()
                                                                            Text( i.price)
                                                                                .font(.title3)
                                                                                .fontWeight(.bold)
                                                                        }
                                                                    }
                                                                    .frame(width: 210)
                                                                    .padding()
                                                                    .background(Color.white )
                                                                    .cornerRadius(20.0)
                                                                }
                                                            )
                                                                .navigationBarHidden(true)
                                                                .foregroundColor(.black)
                                                        }
                                                        .padding(.leading)
                                                    }
                                                }
                        Text("Most Viewed")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))

                        ScrollView (.horizontal, showsIndicators: false) {
                                                    HStack (spacing: 0) {
                                                        ForEach(view, id: \.id) { i in
                                                            NavigationLink(
                                                                destination: ViewedMangaDetailScreen(view:i),
                                                                label: {
                                                                    VStack {
                                                                        i.image
                                                                            .resizable()
                                                                            .frame(width: 210, height: 200 * (210/210))
                                                                            .cornerRadius(20.0)
                                                                        Text(i.name).font(.title3).fontWeight(.bold).foregroundColor(Color("Primary"))

                                                                        HStack (spacing: 2) {
                                                                            Text("Rate: " + i.rating)
                                                                            Spacer()
                                                                            Text( i.price)
                                                                                .font(.title3)
                                                                                .fontWeight(.bold)
                                                                        }
                                                                    }
                                                                    .frame(width: 210)
                                                                    .padding()
                                                                    .background(Color.white )
                                                                    .cornerRadius(20.0)
                                                                }
                                                            )
                                                                .navigationBarHidden(true)
                                                                .foregroundColor(.black)
                                                        }
                                                        .padding(.leading)
                                                    }
                                                }
                        
                        
                        Text("Top Trending")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                                                    HStack (spacing: 0) {
                                                        ForEach(trend, id: \.id) { i in
                                                            NavigationLink(
                                                                destination: TrendMangaDetailScreen(trend:i),
                                                                label: {
                                                                    VStack {
                                                                        i.image
                                                                            .resizable()
                                                                            .frame(width: 210, height: 200 * (210/210))
                                                                            .cornerRadius(20.0)
                                                                        Text(i.name).font(.title3).fontWeight(.bold).foregroundColor(Color("Primary"))

                                                                        HStack (spacing: 2) {
                                                                            Text("Rate: " + i.rating)
                                                                            Spacer()
                                                                            Text( i.price)
                                                                                .font(.title3)
                                                                                .fontWeight(.bold)
                                                                        }
                                                                    }
                                                                    .frame(width: 210)
                                                                    .padding()
                                                                    .background(Color.white )
                                                                    .cornerRadius(20.0)
                                                                }
                                                            )
                                                                .navigationBarHidden(true)
                                                                .foregroundColor(.black)
                                                        }
                                                        .padding(.leading)
                                                    }
                                                }
                        
                                       
    }}
        }
    }
    }
    // Tab button
    @ViewBuilder
    func TabButton(tab: Tab)->some View{
    
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()){
                    currentTab=tab
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
            
        }
        .frame(height: 30)
    }
}

struct TitleView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Manga!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}


struct SearchBar: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
                    .foregroundColor(.black.opacity(0.8))
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
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

