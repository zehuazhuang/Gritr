

import SwiftUI
import SwiftfulRouting

struct AuditoriumLogin: View {
    @State private var parlorEmail: String = ""
    @State private var elstringPassword: String = ""
    @FocusState private var twelvesField: Field?
    enum Field: Hashable {
        case parlorEmail, elstringPassword
    }
    @Environment(\.router) var router
   
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            
                VStack{
                    HStack{
                        Button(action: {
                            router.dismissScreen()
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
                        Text("sign in")
                            .font(.system(size: 36, weight: .black))
                            .foregroundColor(.white)
                            .kerning(1.2)
                        Spacer()
                        Spacer().frame(width: 40, height: 40)
                        
                       
                    }
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading,spacing: 16){
                            Spacer().frame( height: 80)
                            Text("Email:")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                            ZStack(alignment: .leading) {
                                if parlorEmail.isEmpty {
                                    Text("Enter email address")
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.leading, 16)
                                }
                                
                                TextField("", text: $parlorEmail)
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .focused($twelvesField, equals: .parlorEmail)

                            }
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(20)
                            .padding(.bottom,14)
                            HStack{
                                Text("Password:")
                                                        .font(.system(size: 18, weight: .bold))
                                                        .foregroundColor(.white)
                                Spacer()
                                Text("FORGOT?")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                                    
                            }
                            ZStack(alignment: .leading) {
                                if elstringPassword.isEmpty {
                                    Text("Enter password")
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.leading, 16)
                                }
                                
                                SecureField("", text: $elstringPassword)
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .focused($twelvesField, equals: .elstringPassword)
                            }
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(20)
                            .padding(.bottom,14)
                            
                            Spacer().frame(height: 80)
                            Button(action: {
                                
                                if(parlorEmail == "" || elstringPassword == ""){
                                    ToastManager.shared.show("Please enter your email address and password.")
                                    return
                                }
                                
                                
                                
                                let index = SustainStorge.shared.reverbUsers.firstIndex {
                                    $0.equalizerEmail == parlorEmail &&
                                    $0.tchshiftPassword == elstringPassword
                                }

                                if let index {
                                    CriptionManager.shared.bdivisionShow()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        CriptionManager.shared.liefactionHide()
                                        
                                        SustainStorge.shared.epickingLIndex = index
                                        router.dismissScreen()
                                    }
                                    
                                   
                                    
                                } else {
                                    ToastManager.shared.show("Incorrect email or password entered.")
                                }
                             
                                
                                
                                
                                
                                           }) {
                                               Text("Sign in")
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
                                       
                        }.frame(maxWidth: .infinity,alignment: .leading)
                    }
                }.padding(.horizontal,16)
            RacticeLoding()
        }.onTapGesture {
            twelvesField = nil
        }
    }
}
