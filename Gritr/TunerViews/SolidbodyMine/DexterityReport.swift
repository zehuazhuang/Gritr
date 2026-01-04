

import SwiftUI

struct DexterityReport: View {
    var body: some View {
        ZStack{
            Image("gritr_bottommb")
                            .resizable()
                            .frame(height: 254)
                            .frame(maxHeight: .infinity,alignment: .bottom)
                            .ignoresSafeArea()
            VStack(spacing:22){
                Spacer()
                Button(action: {
                                   
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
