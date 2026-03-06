


import SwiftUI

struct MapwoodleEula: View {
    @Binding var pibowAho: Bool
   
    var body: some View {
        ZStack{
            Color.black
                .opacity(0.45)
                .ignoresSafeArea()
                .onTapGesture {
                    pibowAho = false
                }
            
            Image("gritr_bciweu")
                            .resizable()
                            .frame(height: 509)
                            .frame(maxHeight: .infinity,alignment: .bottom)
                            .ignoresSafeArea()
            VStack(spacing:0){
                Spacer()
                
                Text("EULA")
                           .font(.system(size: 20, weight: .bold))
                           .foregroundColor(.black)
                           .padding(.bottom,20)
                Text("Welcome to Gritr! To make a better and safer \ncommunity, the following content is not allowed in\nthe app:\nAny content involving child harm, pornography, or\nmaterial harmful to minors.\nFalse, misleading, or harmful information related\n to recent or current events.\nAny violence, bullying, harassment, or public\npromotion of pornography and inappropriate \ncontent.\nIf we find any violations including but not limited \nto the above, your content will be deleted and \nyour account may be banned or suspended.\nBy clicking the button above, you agree to the\nTerms of Use and Privacy Policy.")
                           .font(.system(size: 14, weight: .regular))
                           .foregroundColor(.black)
                           .padding(.bottom,46)
                           .lineSpacing(4)
                
                HStack(spacing:15){
                    Button(action: {
                        pibowAho = false
                                    }) {
                                        Text("Cancel")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(.white)
                                            .frame(width: 160, height: 50)
                                    }
                                    .background(
                                        Color(red: 234/255, green: 66/255, blue: 190/255)
                                    )
                                    .cornerRadius(60)
                    Button(action: {
                      
                        SustainStorge.shared.saveOnsenceicEu("1")
                        pibowAho = false
                     
                                    }) {
                                        Text("Agree")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(.black)
                                            .frame(width: 160, height: 50)
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
