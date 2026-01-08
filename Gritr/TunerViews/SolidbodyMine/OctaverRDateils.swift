

import SwiftUI
import SwiftfulRouting

struct OctaverRDateils: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
    let jearitieReport : [String] = [
        "Pornographic \ncontent",
        "Infringement",
        "Discriminatory \nremarks",
        "Spreading false \ncontent",
        "Harass others",
        "Cyber violence",
        "Fraudulent \nbehavior",
        "Others",
    ]
    @Environment(\.router) var router
    @State private var panskirReport: String = ""
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
                            ForEach(jearitieReport,id: \.self) {item in
                                    ZStack{
                                        Text(item)
                                        
                                                                .font(.system(size: 16, weight: .medium))
                                                                .foregroundColor(.white)
                                                                .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 165, height: 76)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        panskirReport == item ? Color(red: 234/255, green: 66/255, blue: 190/255) :
                                        Color.white.opacity(0.1)
                                    )
                                    .cornerRadius(20)
                                    .onTapGesture {
                                        withAnimation{
                                            panskirReport = item
                                        }
                                    }
                                }
                        }
                        Spacer()
                        Button(action: {
                            CriptionManager.shared.bdivisionShow()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                CriptionManager.shared.liefactionHide()
                                router.dismissScreen()
                                ToastManager.shared.show("Thank you for your feedback.")
                            }
                                           
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
            RacticeLoding()
        }
    }
}
