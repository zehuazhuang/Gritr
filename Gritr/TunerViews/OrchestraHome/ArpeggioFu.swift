import SwiftUI

struct ArpeggioFu: View {
    let cedarhGift : FactoryGift
    let iopunknName : String
    @Binding var hearsalShow: Bool
    @State private var modelingShowRech: Bool = false
    let onEdrill : () -> Void
    
    var body: some View {
        ZStack{
            Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
            ZStack{
                Image("gritr_jianbm").resizable()
                VStack(spacing:0){
                    Text("Are you sure you want to give this gift")
                                            .font(.system(size: 16, weight: .regular))
                                            .foregroundColor(.black)
                    HStack{
                        Text("to")
                                                .font(.system(size: 16, weight: .regular))
                                                .foregroundColor(.black)
                        Text(iopunknName)
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.black)
                    }
                    Spacer().frame(height: 26)
                    
                    HStack{
                        Image(cedarhGift.laminateImg)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("=")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.black)
                        Image("gritr_zuan")
                            .resizable()
                            .frame(width: 36, height: 36)
                        Text("\(cedarhGift.lacquerGood)")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.black)
                        
                    }
                    Spacer().frame(height: 34)
                    HStack(spacing:15){
                        Button(action: {
                            hearsalShow = false
                                        }) {
                                            Text("Cancel")
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundColor(.black)
                                                .frame(width: 140, height: 50)
                                        }
                                        .background(
                                            Color(red: 234/255, green: 66/255, blue: 190/255)
                                        )
                                        .cornerRadius(60)
                        Button(action: {
                            if(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].noisegateGood >= cedarhGift.lacquerGood){
                                
                                SustainStorge.shared.updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
                                    user.noisegateGood -= cedarhGift.lacquerGood
                                }
                                
                                hearsalShow = false
                                
                                onEdrill()
                                
                            }else{
                                withAnimation{
                                    modelingShowRech = true
                                }
                            }
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
                    }
                    
                }
                                
                
            }.frame(width: 335,height: 260)
            if modelingShowRech {
                CabinetRecharge(
                    steelbarShow: $modelingShowRech,
         
                )
                .transition(.opacity)
                
            }
        }
    }
}
