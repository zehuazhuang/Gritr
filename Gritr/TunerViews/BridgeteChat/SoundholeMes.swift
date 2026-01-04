

import SwiftUI

struct SoundholeMes: View {
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack{
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
                    Text("Message")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                ScrollView{
                    VStack(spacing:26){
                        ForEach(0..<3){index in
                            VStack(spacing:8){
                                HStack(spacing:15){
                                    Image("gritr_icon")
                                        .resizable()
                                        .frame(width: 55, height: 55)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                        )
                                    Text("Username")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("6:00 am")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                HStack{
                                    Text("Your work is so creative!")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                    Spacer()
                                    
                                }
                            }
                            
                        }
                    }
                }
            }.padding(.horizontal,16)
        }
    }
}
