import SwiftUI

struct MangaDetailScreen: View {
    
    var pop: PopularManga
        
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                
                pop.image
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                VStack (alignment: .leading) {
                    //                Title
                    Text(pop.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    //                Rating
                    HStack (spacing: 4) {
                        
                        Text("Rating: " + pop.rating)
                            .opacity(0.5)
                            .padding(.leading, 8)
                        Spacer()
                    }
                    
                    Text("Description")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                    Text(pop.description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                    
                    //                Info
                    HStack (alignment: .top) {
                        VStack (alignment: .leading) {
                            Text("Genres")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text(pop.genres)
                                .opacity(0.6)
                            
                        }
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            Text("Author")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text(pop.author)
                                .opacity(0.6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical)
                    
                    //                Colors and Counter
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Number of chapter")
                                .fontWeight(.semibold)
                            HStack {
                                Text(pop.chapterNumber)
                                    .opacity(0.6)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            //                        Minus Button
                            Button(action: {}) {
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                                    .padding(.all, 8)
                                    .background(Color("Primary"))
                                    .clipShape(Circle())
                                
                            }
                            .frame(width: 30, height: 30)
                            .overlay(RoundedCorner(radius: 50).stroke())
                            .foregroundColor(.black)
                            
                            Text("1")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)
                            
                            //                        Plus Button
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .padding(.all, 8)
                                    .background(Color("Primary"))
                                    .clipShape(Circle())
                            }
                        }
                        
                    }
                }
                .padding()
                .padding(.top)
                .background(Color(.black))
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .offset(x: 0, y: -30.0)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text(pop.price)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
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

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct MangaDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailScreen(pop: pop[0])
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}



struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
