import SwiftUI

struct LightgaugeChouTi: View {
    @Binding var CoatedShow: Bool
    var body: some View {
        ZStack{
            Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                                    CoatedShow = false
                                                }
                            }
                            
            ZStack{
                VStack(spacing:30){
                    Spacer().frame(height: 1)
                    HStack(spacing:12){
                        Image("gritr_icon")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                            )
                        Text("Daniele")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                        Spacer()
                    }
                    HStack(spacing:49){
                        
                        VStack(spacing:4){
                            Text("414")
                                                    .font(.system(size: 16, weight: .black))
                                                    .foregroundColor(.white)
                            Text("Followers")
                                                    .font(.system(size: 10, weight: .regular))
                                                    .foregroundColor(.white.opacity(0.5))
                        }
                        
                        VStack(spacing:4){
                            Text("888")
                                                    .font(.system(size: 16, weight: .black))
                                                    .foregroundColor(.white)
                            Text("Following")
                                                    .font(.system(size: 10, weight: .regular))
                                                    .foregroundColor(.white.opacity(0.5))
                        }
                        Spacer()
                    }
                    VStack(spacing:20){
                        HStack{
                            Text("Works")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }.frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                        
                        HStack{
                            Text("Blacklist")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }.frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                        
                        HStack{
                            Text("Wallet")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }.frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                        
                        HStack{
                            Text("Privacy Policy")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }.frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                        
                        HStack{
                            Text("User Agreement")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }.frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                    }
                    Spacer()
                    VStack(spacing:24){
                        Button(action: {
                            SustainStorge.shared.epickingLIndex = -1
                                        }) {
                                            Text("Log Out")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.black)
                                                .frame(height: 50)
                                                .frame(maxWidth: .infinity)
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
                        Button(action: {
                                            
                                        }) {
                                            Text("Delete Account")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.black)
                                                .frame(height: 50)
                                                .frame(maxWidth: .infinity)
                                        }
                                        .background(
                                            Color(red: 234/255, green: 66/255, blue: 190/255)
                                        )
                                        .cornerRadius(60)
                        
                    }
                    
                }.padding(.horizontal,16)
                
            }.frame(width: UIScreen.main.bounds.width * 0.8)
                .frame(maxHeight: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 91/255, green: 22/255, blue: 98/255),
                            Color(red: 12/255, green: 12/255, blue: 12/255)
                            
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}
