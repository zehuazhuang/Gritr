
import SwiftUI
import SwiftfulRouting
import AVFoundation

struct PlectrumYanTing: View {
    @State private var windingContent: String = ""
    @FocusState private var saddleField: Field?
    enum Field: Hashable {
        case windingContent
    }
    @State private var zopickupShowGift: Bool = false
    @State private var showGiftHStack: Bool = false
    @State private var autowahShowClose: Bool = false
    let legatoRoom : VoicingRooms
    @Environment(\.router) var router
    @State private var uescalePlayer: AVAudioPlayer?
    @State private var andtappingUser: ReverbUsers = ReverbUsers.default
    @State private var odulationComments: [IalharmonComments] = []
    
    @State private var stpieputImg: String = "gritr_gift_1"
    @State private var giftShowCount: Int = 0
    let onUpdaProgr: () -> Void
    @State private var dcheponUserid: Int  = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId
    @State private var vintageShow: Bool = true
    @State private var opentunIs: Bool = false
    @State private var inneranReShow: Bool = false
    @State private var hespiritUserId: Int = -1
    let onUpdaCmind: () -> Void
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack(spacing:0){
                HStack{
                    Button(action: {
                        if(legatoRoom.strumminUserId == dcheponUserid){
                            withAnimation{
                                autowahShowClose = true
                            }
                        }else{
                            router.dismissScreen()
                            onUpdaCmind()
                        }
                        
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
                    if dcheponUserid != legatoRoom.strumminUserId {
                        Image("gritr_report")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .onTapGesture {
                                            withAnimation{
                                                hespiritUserId = andtappingUser .hykingUserId
                                                inneranReShow = true
                                                
                                            }
                                        }
                    }
                    
                }.padding(.horizontal,16)
                    .padding(.bottom,30)
                ZStack{
                    Circle()
                        .fill(Color(red: 234/255, green: 66/255, blue: 190/255,opacity: 0.2))
                        .frame(width: 135,height: 135)
                    Image(andtappingUser.strumAvatar)
                        .resizable()
                        .frame(width: 115, height: 115)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                        )
                }
                .frame(width: 165,height: 165)
                .background( Color(red: 234/255, green: 66/255, blue: 190/255,opacity: 0.2))
                .clipShape(Circle())
                Spacer().frame(height: 12)
                Text(andtappingUser.aidrivenName)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                Spacer().frame(height: 8)
                if dcheponUserid != legatoRoom.strumminUserId {
                    Button(action: {
                        SustainStorge.shared.tunheadpinFol(from: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId, to: legatoRoom.strumminUserId)
                        
                        updUshpUser()
                                   }) {
                                       Text(opentunIs ? "- Unfollow" : "+ Follow")
                                           .font(.system(size: 14, weight: .medium))
                                           .foregroundColor(.white)
                                           .frame(width: 90, height: 34)
                                   }
                                   .background(
                                    opentunIs ?
                                    Color(red: 204/255, green: 204/255, blue: 204/255)
                                    :
                                    Color(red: 234/255, green: 66/255, blue: 190/255)
                                   )
                                   .cornerRadius(60)
                }
              
                
                Spacer().frame(height: 15)
                HStack{
                    HStack{
                        Image(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 1)
                            )
                        
                        Text(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].aidrivenName)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                        
                        Image(stpieputImg)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.trailing,6)
                        
                    }
                    .padding(4)
                    .background(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(red: 255/255, green: 195/255, blue: 0/255).opacity(0), location: 0.0),
                                .init(color: Color(red: 255/255, green: 195/255, blue: 0/255), location: 1)
                                
                            ]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .cornerRadius(60)
                    .opacity(showGiftHStack ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: showGiftHStack)
                    Spacer()
                }
                .padding(.horizontal,16)
                Spacer().frame(height: 15)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.1))
                        .ignoresSafeArea()
                    
                    ScrollView{
                        VStack(spacing:20){
                            ForEach(odulationComments,id: \.bentwohdCommId){item in
                                let ondensUser = SustainStorge.shared.getRadiusUser(by: item.pmeteroUserId)
                                HStack(alignment:.top,spacing:15){
                                    Image(ondensUser.strumAvatar)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                            )
                                        VStack(alignment: .leading,spacing: 5){
                                            Text(ondensUser.aidrivenName)
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white)
                                            Text(item.seventhcText)
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.white.opacity(0.5))
                                        }.padding(.top,5)
                                        Spacer()
                                        Image("gritr_report")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .padding(.top,5)
                                                        .onTapGesture {
                                                            withAnimation{
                                                                hespiritUserId = ondensUser.hykingUserId
                                                                inneranReShow = true
                                                                
                                                            }
                                                        }
                                    }
                            }
                        }.padding(.leading,16)
                            .padding(.trailing,26)
                         .padding(.top,33)
                    }
                    
                    VStack{
                        Spacer()
                        VStack{
                            HStack(spacing:12){
                                ZStack(alignment: .leading) {
                                    if windingContent.isEmpty {
                                        Text("Enter...")
                                            .foregroundColor(.white.opacity(0.5))
                                            .padding(.leading, 16)
                                    }
                                    
                                    TextField("", text: $windingContent)
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .focused($saddleField, equals: .windingContent)
                                        .submitLabel(.send)
                                        .onSubmit {
                                            if (windingContent != ""){
                                                SustainStorge.shared.addMonitorComment(
                                                    IalharmonComments(
                                                        bentwohdCommId: SustainStorge.shared.acompodComments.count+1,
                                                        idartifiType: 0,
                                                        seventhcText: windingContent,
                                                        pmeteroUserId: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId,
                                                        cadenceZuopId: legatoRoom.ypickingRoomId)
                                                )
                                                windingContent = ""
                                                loadActonekComment()
                                            }
                                        }

                                }.frame(height: 40)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(60)
                                    
                                if dcheponUserid != legatoRoom.strumminUserId {
                                    Image("gritr_gift")
                                                    .resizable()
                                                    .frame(width: 40, height: 40)
                                                    .onTapGesture {
                                                        withAnimation{
                                                            zopickupShowGift = true
                                                        }
                                                    }
                                }else{
                                    Button(action: {
                                        vintageShow = !vintageShow
                                                    }) {
                                                        Image(vintageShow ? "gritr_voice" : "gritr_mkfjin")
                                                            .resizable()
                                                            .frame(width: 30,height: 30)
                                                            .frame(width: 40, height: 40)
                                                    }
                                                    .background(
                                                        .white.opacity(0.1)
                                                    )
                                                    .clipShape(Circle())
                                }
                            
                            }.padding(.horizontal,16)
                            
                        }.frame(height: 65)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 23/255, green: 23/255, blue: 23/255))
                    }
                }
            }
            
            if zopickupShowGift {
                TuningpegGift(backlineShow: $zopickupShowGift, ineagiUser: andtappingUser, onEdrill: {value in
                    withAnimation(.easeInOut(duration: 0.4)) {
                        stpieputImg = value.laminateImg
                        SustainStorge.shared.updaRackinRoom(by: legatoRoom.ypickingRoomId){ room in
                            room.pentatoniHot += value.solidwoodPop
                        }
                        
                                showGiftHStack = true
                            }
                    
                   
                    giftShowCount += 1
                            let currentCount = giftShowCount

                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                              
                                if currentCount == giftShowCount {
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        showGiftHStack = false
                                       
                                    }
                                }
                            }
                    onUpdaProgr()
                })
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
            }
      
            if autowahShowClose {
                FootswitchClose(fislidenRoomId: legatoRoom.ypickingRoomId, trdreShow: $autowahShowClose, onUmgaug: {
                    router.dismissScreen()
                })
                    .transition(.opacity)
            }
 
        }
        .deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: hespiritUserId){}
        .onTapGesture {
            saddleField = nil
        }.onAppear {
            updUshpUser()
            
            loadActonekComment()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if(legatoRoom.asebendBeiYin != ""){
                    hotriadrdPlayer()
                }else{
                    PluchdecaykPer.requestMicrophone{}
                }
            }
            
        }.onDisappear {
            uescalePlayer?.stop()
        }
    }
    func updUshpUser(){
        andtappingUser = SustainStorge.shared.reverbUsers.first {
            $0.hykingUserId == legatoRoom.strumminUserId
        } ?? ReverbUsers.default
        
        opentunIs = andtappingUser.tpickingFans.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId)
    }
    
    func loadActonekComment(){
        DispatchQueue.main.async {
            odulationComments = SustainStorge.shared.acompodComments.filter{
                $0.idartifiType == 0 && $0.cadenceZuopId == legatoRoom.ypickingRoomId
            }
        }
    }
    
    
    func hotriadrdPlayer() {
        guard let nisonPath = Bundle.main.path(forResource: legatoRoom.asebendBeiYin, ofType: "mp3") else {
            
            return
        }
        
        let majblUrl = URL(fileURLWithPath: nisonPath)
        
        do {
            uescalePlayer = try AVAudioPlayer(contentsOf: majblUrl)
            uescalePlayer?.numberOfLoops = -1
            uescalePlayer?.prepareToPlay()
            uescalePlayer?.play()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
}


