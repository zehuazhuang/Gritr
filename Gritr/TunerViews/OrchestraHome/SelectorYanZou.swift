

import SwiftUI
import SwiftfulRouting

struct SelectorYanZou: View {
    @Environment(\.router) var router
    @State private var harmonicRooms: [VoicingRooms] = []
    @State private var inneranReShow: Bool = false
    @State private var hespiritUserId: Int = -1
    let onUpdaTranqu: () -> Void
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
                        onUpdaTranqu()
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
                    Text("Show Room")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                    
                   
                }
                ScrollView{
                    VStack(alignment:.leading,spacing: 20){
                        
                    ZStack{
                        Image("gritr_room_backg")
                            .resizable()
                        HStack{
                            Text("Create a \nshow room")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            
                           
                                Text("Create")
                                    .font(.system(size: 14, weight: .black))
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 40)
                                    .background(
                                        .black
                                    )
                                    .cornerRadius(60)
                                
                            
                            
                        }.padding(.horizontal,15)
                        
                    }.frame(height: 90)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom,10)
                        .onTapGesture {
                            router.showScreen(.fullScreenCover) { _ in
                                UncoatedCreate { newRoom in
                                   
                                    router.showScreen(.fullScreenCover) { _ in
                                        PlectrumYanTing(
                                            legatoRoom: newRoom,
                                            onUpdaProgr: {
                                               
                                            }, onUpdaCmind: {}
                                        )
                                    }
                                }
                            }
                        }
                        Text("Recommended:")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                        ScrollView(showsIndicators: false){
                            VStack(spacing:20){
                                ForEach(harmonicRooms,id: \.ypickingRoomId){item in
                                    HeneleckRoom(minorscaRoom: item, locanckiRep: {
                                        withAnimation{
                                            inneranReShow = true
                                            hespiritUserId = item.strumminUserId
                                        }
                                    })
                                        .onTapGesture{
                                            router.showScreen(.fullScreenCover) { _ in
                                                
                                                PlectrumYanTing(legatoRoom: item, onUpdaProgr: {
                                                    harmonicRooms = SustainStorge.shared.chromaticRooms
                                                }, onUpdaCmind: {})
                                                   
                                                           }
                                        }
                                }
                            }
                        }
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                }
            }.padding(.horizontal,16)
        }.deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: hespiritUserId){
            loadArdenResult()
        }
        .onAppear{
    
            loadArdenResult()
            
        }
    }
    func loadArdenResult(){
        let ghtiBlock = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].bridpicBlock
        harmonicRooms = SustainStorge.shared.chromaticRooms.filter{
            !ghtiBlock.contains($0.strumminUserId)
        }
    }
}
