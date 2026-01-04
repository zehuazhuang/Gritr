
import SwiftUI

struct SignatureTaren: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack(spacing:0){
                    HStack{
                        Button(action: {
                                            
                                        }) {
                                            Image("gritr_back")
                                                .resizable()
                                                .frame(width: 8,height: 16)
                                                .frame(width: 40, height: 40)
                                                
                                        }
                                        .background(
                                            .white.opacity(0.1)
                                        )
                                        .clipShape(Circle())
                        Spacer()
                        Image("gritr_report")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                    }
                Spacer().frame(height: 30)
                ScrollView{
                    VStack(spacing:0){
                        Image("gritr_icon")
                                        .resizable()
                                        .frame(width: 115, height: 115)
                                        .clipShape(Circle())
                        Spacer().frame(height: 16)
                        Text("Username")
                                                .font(.system(size: 24, weight: .bold))
                                                .foregroundColor(.white)
                        Spacer().frame(height: 30)
                        
                        HStack{
                            Spacer()
                            VStack(spacing:4){
                                Text("414")
                                                        .font(.system(size: 16, weight: .black))
                                                        .foregroundColor(.white)
                                Text("Followers")
                                                        .font(.system(size: 10, weight: .regular))
                                                        .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
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
                        Spacer().frame(height: 19)
                        HStack{
                            Button(action: {
                                                
                                            }) {
                                                Text("+ Follow")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                                                    .frame(width: 165, height: 52)
                                                    
                                            }
                                            .background(
                                                Color(red: 234/255, green: 66/255, blue: 190/255)
                                            )
                                            .cornerRadius(60)
                            
                            Button(action: {
                                                
                                            }) {
                                                HStack{
                                                    Image("gritr_liao")
                                                                    .resizable()
                                                                    .frame(width: 28, height: 28)
                                                    
                                                    Text("Chat")
                                                        .font(.system(size: 16, weight: .bold))
                                                        .foregroundColor(.black)
                                                        
                                                }.frame(width: 165, height: 52)
                                                    
                                            }
                                            .background(
                                                Color.white
                                            )
                                            .cornerRadius(60)
                        }
                        Spacer().frame(height: 30)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<10) {index in
                                PickupDynamic()
                                }
                        }
                        
                        
                        
                    }
                }
            }.padding(.horizontal,16)
        }
    }
}
