

import SwiftUI
import SwiftfulRouting

struct SoundholeMes: View {
    @Environment(\.router) var router
    @State private var difupopsChats: [DroptunChats] = []
    @State private var toubasrInfo: String = ""
    @State private var rapidetoTime: String = ""
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
                    Text("Message")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                ScrollView{
                    VStack(spacing:26){
                        ForEach(difupopsChats,id: \.fbeworpChatId){item in
                          
                                    

                                let medouieUid =
                                    item.loseishUsers.first { $0 != SustainStorge.shared.reverbUsers[
                                        SustainStorge.shared.epickingLIndex
                                    ].hykingUserId }

                                let mythmeUser =
                                    SustainStorge.shared.getRadiusUser(by: medouieUid ?? -1)
                            
                            let ovsouteInfo = SustainStorge.shared.flangerInfo
                                .filter { $0.oxenuatoChatId == item.fbeworpChatId }
                                .sorted { $0.felickelId < $1.felickelId }
                            
                            let lastSautInfo = ovsouteInfo.last
                            VStack(spacing:8){
                                HStack(spacing:15){
                                    Group {
                                        if let cisbeatImg = UIImage(contentsOfFile: mythmeUser.strumAvatar) {
                                            Image(uiImage: cisbeatImg)
                                                .resizable()
                                        } else {
                                            Image(mythmeUser.strumAvatar)
                                                .resizable()
                                        }
                                    }
                                    
                                        .frame(width: 55, height: 55)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                        )
                                    Text(mythmeUser.aidrivenName)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(lastSautInfo?.moakernSendTime ?? "")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                HStack{
                                    Text(
                                        !(lastSautInfo?.rimionhText.isEmpty ?? true)
                                            ? lastSautInfo!.rimionhText
                                            : !(lastSautInfo?.temoveVoice.isEmpty ?? true)
                                                ? "[voice]"
                                                : ""
                                    )
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                    Spacer()
                                    
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture{
                                router.showScreen(.fullScreenCover) { _ in
                                    ToastHost {
                                        MahoganyChat(mgasivepChatId: item.fbeworpChatId, drcisebeUser: mythmeUser, onUpdaSereni: {
                                            loadOftbreeResult()
                                        })
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }.padding(.horizontal,16)
        }.onAppear{
            loadOftbreeResult()
        }
    }
    func loadOftbreeResult(){
        let ghtiBlock = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].bridpicBlock
        difupopsChats = SustainStorge.shared.tunbackChats.filter{
            $0.loseishUsers.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId)
            && !ghtiBlock.contains($0.loseishUsers[0])
            && !ghtiBlock.contains($0.loseishUsers[1])
        }
    }
}
