import SwiftUI

struct SemihollowHome: View {
    @State private var CoatedShow: Bool = false
    
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack{
                HStack{
                    HStack{
                        Image("gritr_icon")
                                        .resizable()
                                        .frame(width: 52,height: 52)
                                        .clipShape(Circle())
                                        .onTapGesture {
                                           
                                            withAnimation {
                                                                CoatedShow = true
                                                            }
                                         
                                            
                                        }
                        VStack(alignment:.leading,spacing: 1){
                            Text("Hello!")
                                                    .font(.system(size: 14, weight: .regular))
                                                    .foregroundColor(.white)
                            Text("Daniele")
                                .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Button(action: {
                                        
                                    }) {
                                        Image("gritr_message")
                                            .resizable()
                                            .frame(width: 34,height: 34)
                                            .frame(width: 52, height: 52)
                                            
                                    }
                                    .background(
                                        .white.opacity(0.1)
                                    )
                                    .clipShape(Circle())
                }.padding(.horizontal,16)
                //滑
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading,spacing: 13){
                        HStack(spacing:7){
                            Image("gritr_folaix")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Follow")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                        }
                        .padding(.leading,16)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:26){
                                ForEach(0..<5) {index in
                                    VStack(spacing:8){
                                        Image("gritr_icon")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                            )
                                        Text("Kalani")
                                                                .font(.system(size: 12, weight: .medium))
                                                                .foregroundColor(.white)
                                    }
                                }
                            }.padding(.horizontal,16)
                        }.padding(.bottom,10)
                        HStack(spacing:7){
                            Image("gritr_wuzi")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Show Room")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                            Spacer()
                            Text("See more")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                                .underline(true)
                        }.padding(.horizontal,16)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:13){
                            ForEach(0..<5) {index in
                                        HeneleckRoom()
                                            .frame(width: 280, height: 120)
                                }
                            }.padding(.horizontal,16)
                        }
                        HStack(spacing:7){
                            Image("gritr_hotred")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Popular")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                           
                        }.padding(.horizontal,16)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:13){
                            ForEach(0..<5) {index in
                                PickupDynamic()
                                }
                            }.padding(.horizontal,16)
                        }
                    }.frame(maxWidth: .infinity,alignment: .leading)
                }
                //滑 end
            }
            Button(action: {
                               
                           }) {
                               Image("gritr_add")
                                               .resizable()
                                               .frame(width: 16, height: 16)
                                   .frame(width: 48, height: 48)
                                   
                           }
                           .background(
                               LinearGradient(
                                   gradient: Gradient(stops: [
                                       .init(color: Color(red: 255/255, green: 102/255, blue: 222/255), location: 0.0),
                                       .init(color: Color(red: 255/255, green: 203/255, blue: 125/255), location: 0.3455),
                                       .init(color: Color(red: 171/255, green: 254/255, blue: 255/255), location: 0.6389),
                                       .init(color: Color(red: 115/255, green: 211/255, blue: 255/255), location: 1.0)
                                   ]),
                                   startPoint: .trailing,
                                   endPoint: .leading
                               )
                           )
                           .clipShape(Circle())
                           .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                           .padding(.bottom,35)
                           .padding(.trailing,10)
            
            if CoatedShow {
                LightgaugeChouTi(CoatedShow: $CoatedShow)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct PickupDynamic: View {
    var body: some View {
        ZStack{
            Image("gritr_icon")
                            .resizable()
                            .frame(width: 165, height: 220)
                            .cornerRadius(20)
                            .frame(maxHeight: .infinity,alignment: .top)
            Image("gritr_report")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                            .padding(10)
            
            HStack(spacing: 7) {
                Image("gritr_icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

                Text("Daniele")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)

                Spacer()

                Image("gritr_like")
                    .resizable()
                    .frame(width: 22, height: 22)
            }
            .padding(.horizontal, 9)
            .frame(width: 145, height: 48)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 33/255, green: 34/255, blue: 40/255).opacity(0.6))
                    .blur(radius: 6)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                    )
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
                            
        }.frame(width: 165,height: 244)
    }
}

struct HeneleckRoom: View {
    var body: some View {
        HStack{
            Image("gritr_icon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
            VStack(alignment:.leading,spacing: 0){
                HStack{
                    Text("Room Title")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                    Spacer()
                    Image("gritr_report")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                }
                Text("Come and listen to the latest songs together")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.top,5)
                Spacer()
                HStack(spacing:4){
                    Image("gritr_eye")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                    Text("0")
                                            .font(.system(size: 10, weight: .regular))
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(.trailing,6)
                    Image("gritr_hot")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                    Text("0")
                                            .font(.system(size: 10, weight: .regular))
                                            .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Button(action: {
                                        
                                    }) {
                                        Text("Go")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(Color(red: 12/255, green: 12/255, blue: 12/255))
                                            .frame(width: 58, height: 24)
                                            
                                    }
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(stops: [
                                                .init(color: Color(red: 255/255, green: 102/255, blue: 222/255), location: 0.0),
                                                .init(color: Color(red: 255/255, green: 203/255, blue: 125/255), location: 0.3455),
                                                .init(color: Color(red: 171/255, green: 254/255, blue: 255/255), location: 0.6389),
                                                .init(color: Color(red: 115/255, green: 211/255, blue: 255/255), location: 1.0)
                                            ]),
                                            startPoint: .trailing,
                                            endPoint: .leading
                                        )
                                    )
                                    .cornerRadius(60)
                                            
                    
                }
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(red: 56/255, green: 41/255, blue: 57/255))
        )
    }
}
