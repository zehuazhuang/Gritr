

import SwiftUI

struct DexterityReport: View {
    let hearwUserId : Int
    @Binding var gensootShow: Bool
    let goRepoDet : () -> Void
    let onBlock: () -> Void
    var body: some View {
        ZStack{
            Color.black
                .opacity(0.45)
                .ignoresSafeArea()
                .onTapGesture {
                    gensootShow = false
                }
            
            Image("gritr_bottommb")
                            .resizable()
                            .frame(height: 254)
                            .frame(maxHeight: .infinity,alignment: .bottom)
                            .ignoresSafeArea()
            VStack(spacing:22){
                Spacer()
                Button(action: {
                    gensootShow = false
                    goRepoDet()
                               }) {
                                   Text("Report")
                                       .font(.system(size: 18, weight: .bold))
                                       .foregroundColor(.black)
                                       .frame(height: 50)
                                       .frame(maxWidth: .infinity)
                               }
                               .background(
                                   LinearGradient(
                                       gradient: Gradient(stops: [
                                           .init(color: Color(red: 255/255, green: 102/255, blue: 222/255), location: 0.0),
                                         
                                           .init(color: Color(red: 255/255, green: 203/255, blue: 125/255), location: 1.0)
                                       ]),
                                       startPoint: .trailing,
                                       endPoint: .leading
                                   )
                               )
                               .cornerRadius(60)
                Button(action: {
                    gensootShow = false
                    SustainStorge.shared.updaNaturalUser(
                        by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId
                    ) { user in

                       
                        if !user.bridpicBlock.contains(hearwUserId) {
                            user.bridpicBlock.append(hearwUserId)
                        }
                        
                        
                       
                    }
                    ToastManager.shared.show("Blocked")
                    onBlock()
                               }) {
                                   Text("Blacklist")
                                       .font(.system(size: 18, weight: .bold))
                                       .foregroundColor(.black)
                                       .frame(height: 50)
                                       .frame(maxWidth: .infinity)
                               }
                               .background(
                                   LinearGradient(
                                       gradient: Gradient(stops: [
                                           .init(color: Color(red: 171/255, green: 254/255, blue: 255/255), location: 0.0),
                                         
                                           .init(color: Color(red: 115/255, green: 211/255, blue: 255/255), location: 1.0)
                                       ]),
                                       startPoint: .trailing,
                                       endPoint: .leading
                                   )
                               )
                               .cornerRadius(60)
                Button(action: {
                    gensootShow = false
                               }) {
                                   Text("Cancel")
                                       .font(.system(size: 18, weight: .bold))
                                       .foregroundColor(.black)
                                       .frame(height: 50)
                                       .frame(maxWidth: .infinity)
                               }
                               .background(
                                Color.black.opacity(0.2)
                               )
                               .cornerRadius(60)
                              
            }.padding(.horizontal,16)
        }
    }
}
