import SwiftUI

struct OverdriveCoin: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
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
                    Text("Wallet")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
                ScrollView{
                    VStack{
                        Image("gritr_dazuan")
                                        .resizable()
                                        .frame(width: 135, height: 135)
                        Text("0")
                                                .font(.system(size: 28, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.top,8)
                        Text("Balance")
                                                .font(.system(size: 16, weight: .regular))
                                                .foregroundColor(.white.opacity(0.5))
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<10) {index in
                                    ZStack{
                                        HStack{
                                            Image("gritr_dazuan")
                                                            .resizable()
                                                            .frame(width: 40, height: 40)
                                            VStack{
                                                Text("400")
                                                                        .font(.system(size: 18, weight: .bold))
                                                                        .foregroundColor(.white)
                                                Text("$0.99")
                                                                        .font(.system(size: 12, weight: .regular))
                                                                        .foregroundColor(.white.opacity(0.5))
                                            }
                                        }
                                    }
                                    .frame(width: 165, height: 60)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.white.opacity(0.1)
                                    )
                                    .cornerRadius(20)
                                }
                        }
                    }
                }
            }.padding(.horizontal,16)
        }
    }
}
