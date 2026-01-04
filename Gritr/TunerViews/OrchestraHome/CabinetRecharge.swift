import SwiftUI

struct CabinetRecharge: View {
    var body: some View {
        ZStack{
            Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
            ZStack{
                Image("gritr_jianbm").resizable()
                Image("gritr_dahuiz")
                    .resizable()
                    .frame(width: 135, height: 135)
                    .offset(y: -116)
                Spacer().frame(height: 26)
                VStack(spacing:0){
                    
                        Spacer()
                    
                   
             
                        Text("Unfortunately, the account balance\n is insufficient. Please recharge and\n try again.")
                        
                                                .font(.system(size: 16, weight: .medium))
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                                   
                        
                    
                    Spacer().frame(height: 34)
                    HStack(spacing:15){
                        Button(action: {
                                            
                                        }) {
                                            Text("Cancel")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.white)
                                                .frame(width: 140, height: 50)
                                        }
                                        .background(
                                            Color(red: 234/255, green: 66/255, blue: 190/255)
                                        )
                                        .cornerRadius(60)
                        Button(action: {
                                            
                                        }) {
                                            Text("Sure")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.black)
                                                .frame(width: 140, height: 50)
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
                    }.padding(.bottom,20)
                    
                }
                                
                
            }.frame(width: 335,height: 260)
        }
    }
}
