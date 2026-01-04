import SwiftUI

struct NylonstrinSignUp: View {
    @State private var cutawayEmail: String = ""
    @State private var etboardPassword: String = ""
    @State private var adnoughtPassword: String = ""
    @FocusState private var concertField: Field?
    enum Field: Hashable {
        case cutawayEmail, etboardPassword, adnoughtPassword
    }
    let singlecoiType : String
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
                        Text(singlecoiType == "1" ? "sign up" : "Forgot password")
                            .font(.system(size:singlecoiType == "1" ? 36 : 32, weight: .black))
                            .foregroundColor(.white)
                            .kerning(1.2)
                        
                            Spacer()
                        if singlecoiType == "1" {
                            Spacer().frame(width: 40, height: 40)
                        }
                        
                        
                       
                    }
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading,spacing: 16){
                            Spacer().frame( height: 80)
                            Text("Email:")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                            ZStack(alignment: .leading) {
                                if cutawayEmail.isEmpty {
                                    Text("Enter email address")
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.leading, 16)
                                }
                                
                                TextField("", text: $cutawayEmail)
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .focused($concertField, equals: .cutawayEmail)
                            }
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(20)
                            .padding(.bottom,14)
                                Text("Password:")
                                                        .font(.system(size: 18, weight: .bold))
                                                        .foregroundColor(.white)
                            ZStack(alignment: .leading) {
                                if etboardPassword.isEmpty {
                                    Text("Enter password")
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.leading, 16)
                                }
                                
                                SecureField("", text: $etboardPassword)
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .focused($concertField, equals: .etboardPassword)
                            }
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(20)
                            .padding(.bottom,14)
                            Text("Password:")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                        ZStack(alignment: .leading) {
                            if adnoughtPassword.isEmpty {
                                Text("Enter password")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                            
                            SecureField("", text: $adnoughtPassword)
                                .foregroundColor(.white)
                                .padding(16)
                                .focused($concertField, equals: .adnoughtPassword)
                        }
                        .frame(height: 52)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                        .padding(.bottom,14)
                            
                            Spacer().frame(height: 80)
                            Button(action: {
                                           }) {
                                               Text(singlecoiType == "1" ? "sign up" : "Save")
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
          
        }.onTapGesture {
            concertField = nil
        }
    }
}
