

import SwiftUI

struct OctaverRDateils: View {
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
                    Text("Report")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
               
                    VStack{
              
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<10) {index in
                                    ZStack{
                                        Text("Pornographic \ncontent")
                                        
                                                                .font(.system(size: 16, weight: .medium))
                                                                .foregroundColor(.white)
                                                                .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 165, height: 76)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.white.opacity(0.1)
                                    )
                                    .cornerRadius(20)
                                }
                        }
                        Spacer()
                        Button(action: {
                                           
                                       }) {
                                           Text("Submit")
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
                    }
               
            }.padding(.horizontal,16)
        }
    }
}
