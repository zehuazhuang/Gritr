

import SwiftUI
import SwiftfulRouting

struct HeadstockInit: View {
    @State private var baritoneCheck = true
    @Environment(\.router) var router
    var body: some View {
        
        ZStack{
            Image("gritr_initbackg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack(spacing:20){
                Spacer()
                Button(action: {
                    
                    router.showScreen(.fullScreenCover) { _ in
                        ToastHost {
                                AuditoriumLogin()
                            }
                                   }
                }) {
                    Text("Login by email")
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
                
                Button(action: {
                    CriptionManager.shared.bdivisionShow()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        CriptionManager.shared.liefactionHide()
                        SustainStorge.shared.epickingLIndex = 3
                    }
                    
                }) {
                    Text("I'm new")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                }
                .background(
                    Color(red: 1, green: 1, blue: 1,opacity: 0.1)
                )
                .cornerRadius(60)
                
                HStack(spacing:0){
                    Text("Don't have an account?")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.white)
                    Text("Sign up")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                        .underline(true)
                       
                }.padding(.bottom,20)
                    .onTapGesture {
                        router.showScreen(.fullScreenCover) { _ in
                            ToastHost {
                                NylonstrinSignUp(singlecoiType: "1")
                            }
                                       }
                    }
                HStack(spacing: 5) {
                            
                            Button(action: {
                                baritoneCheck.toggle()
                            }) {
                                Image(systemName: baritoneCheck ? "checkmark.square.fill" : "square")
                                    .foregroundColor(baritoneCheck ? Color(red: 234/255, green: 66/255, blue: 190/255) : .white)
                                    .font(.system(size: 16))
                            }

                            
                            HStack(spacing: 0) {
                                Text("Agree with  ")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.white)
                                Text("User Agreement")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                                    .underline(true)
                                    .onTapGesture {
                                        router.showScreen(.fullScreenCover) { _ in
                                            ToastHost {
                                                AlternatounView(calmwStr: "https://app.e07mmblf.link/users")
                                            }
                                         }
                                    }
                                Text(" and ")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.white)
                                Text("Privacy Policy")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                                    .underline(true)
                                    .onTapGesture {
                                        router.showScreen(.fullScreenCover) { _ in
                                            ToastHost {
                                                AlternatounView(calmwStr: "https://app.e07mmblf.link/privacy")
                                            }
                                         }
                                    }
                            }
                        }
                        .padding(.bottom, 35)
            }.padding(.horizontal,16)
            RacticeLoding()
        }
    }
}
