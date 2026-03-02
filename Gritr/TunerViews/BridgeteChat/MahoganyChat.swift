

import SwiftUI
import SwiftfulRouting
import AVFAudio
import Combine





struct MahoganyChat: View {
    @State private var upstrokeContent: String = ""
    @FocusState private var eadroomField: Field?
    @State private var apjambpInfos: [ProvisatInfos] = []
    enum Field: Hashable {
        case upstrokeContent
    }

    @State private var folkunkShow: Bool = false
    let mgasivepChatId : Int
    let drcisebeUser : ReverbUsers
    @Environment(\.router) var router
    
    let eslotanUserId = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId
    
    @State private var animatePulse = false
    @GestureState private var fingerInside: Bool = true
    @StateObject private var recorder = AudioRecorderManager()
    @State private var inneranReShow: Bool = false
    let onUpdaSereni: () -> Void
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 91/255, green: 22/255, blue: 98/255),
                    Color(red: 12/255, green: 12/255, blue: 12/255)
                    
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack(spacing:0){
                HStack{
                    Button(action: {
                        router.dismissScreen()
                        onUpdaSereni()
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
                    Group {
                        if let cisbeatImg = UIImage(contentsOfFile: drcisebeUser.strumAvatar) {
                            Image(uiImage: cisbeatImg)
                                .resizable()
                        } else {
                            Image(drcisebeUser.strumAvatar)
                                            .resizable()
                        }
                    }
                    
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .padding(.leading,6)
                    Text(drcisebeUser.aidrivenName)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                       Spacer()
                    Image("riadagatsp")
                                    .resizable()
                                    .frame(width: 26, height: 26).padding(.trailing,20)
                                    .onTapGesture {
                                        router.showScreen(.fullScreenCover) { _ in
                                            ToastHost {
                                                TiosoloistnIn(lectionUser: drcisebeUser)
                                            }
                                        }
                                    }
                    
                    Image("gritr_report")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .onTapGesture {
                                        withAnimation{
                                            inneranReShow = true
                                        }
                                    }
                }.padding(.horizontal,16)
                    .padding(.bottom,30)
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 30) {
                            ForEach(apjambpInfos, id: \.felickelId) { item in
                                let isCurrentUser = item.grgemoUserId == eslotanUserId
                                
                                HStack {
                                    if isCurrentUser { Spacer() } else {
                                        Group {
                                            if let cisbeatImg = UIImage(contentsOfFile: drcisebeUser.strumAvatar) {
                                                Image(uiImage: cisbeatImg)
                                                    .resizable()
                                            } else {
                                                Image(drcisebeUser.strumAvatar)
                                                    .resizable()
                                            }
                                        }
                                        
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    }
                                    if item.rimionhText == ""{
                                        HStack{
                                            
                                            Image("gritr_voiclu")
                                                            .resizable()
                                                            .frame(width: 24, height: 24)
                                            Text(item.nbtransTime)
                                                                    .font(.system(size: 16, weight: .medium))
                                                                    .foregroundColor(.white)
                                        }
                                        .padding(12)
                                        .background(isCurrentUser ? Color(red: 234/255, green: 66/255, blue: 190/255) : Color.white.opacity(0.1))
                                        .foregroundColor(.white)
                                        .cornerRadius(16)
                                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: isCurrentUser ? .trailing : .leading)
                                        .onTapGesture{
                                            let url = URL(fileURLWithPath: item.temoveVoice)
                                                if FileManager.default.fileExists(atPath: url.path) {
                                                    MurmuraWaveCore.shared.play(url: url)
                                                }
                                        }
                                    }else{
                                        Text(item.rimionhText)
                                            .padding(12)
                                            .background(isCurrentUser ? Color(red: 234/255, green: 66/255, blue: 190/255) : Color.white.opacity(0.1))
                                            .foregroundColor(.white)
                                            .cornerRadius(16)
                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: isCurrentUser ? .trailing : .leading)
                                    }
                                    
                                    
                                    if isCurrentUser {
                                        Group {
                                            if let cisbeatImg = UIImage(contentsOfFile: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar) {
                                                Image(uiImage: cisbeatImg)
                                                    .resizable()
                                            } else {
                                                Image(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar)
                                                    .resizable()
                                            }
                                        }
                                        
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    } else { Spacer() }
                                }
                                .padding(.horizontal, 16)
                                .id(item.felickelId)
                            }
                        }
                        .onChange(of: apjambpInfos.count) { _ in
                            if let last = apjambpInfos.last {
                                proxy.scrollTo(last.felickelId, anchor: .bottom)
                            }
                        }
                    }
                }
                VStack{
                    HStack(spacing:12){
                        ZStack(alignment: .leading) {
                            if upstrokeContent.isEmpty {
                                Text("Enter...")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                            
                            TextField("", text: $upstrokeContent)
                                .foregroundColor(.white)
                                .padding(16)
                                .focused($eadroomField, equals: .upstrokeContent)
                                .submitLabel(.send)
                                .onSubmit {
                                    if (upstrokeContent != ""){
                                        SustainStorge.shared.addAnogfinnfo(
                                            ProvisatInfos(
                                                felickelId: SustainStorge.shared.flangerInfo.count+1,
                                                rimionhText: upstrokeContent,
                                                temoveVoice: "",
                                                nbtransTime: "",
                                                grgemoUserId: eslotanUserId,
                                                oxenuatoChatId: mgasivepChatId,
                                                moakernSendTime: {
                                                    let diitoriaFor = DateFormatter()
                                                    diitoriaFor.dateFormat = "hh:mm a"
                                                    diitoriaFor.locale = Locale(identifier: "en_US_POSIX")
                                                    return diitoriaFor.string(from: Date())
                                                }()
                                            )
                                        )
                                        upstrokeContent = ""
                                        loadDirectiInfo()
                                    }
                                }

                        }.frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(60)
                        
                        Button(action: {
                            eadroomField = nil
                            withAnimation{
                                folkunkShow = true
                            }
                                        }) {
                                            Image("gritr_voice")
                                                .resizable()
                                                .frame(width: 36,height: 36)
                                                .frame(width: 40, height: 40)
                                        }
                                        .background(
                                            .white.opacity(0.1)
                                        )
                                        .clipShape(Circle())
                    }.padding(.horizontal,16)
                    
                }.frame(height: 65)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 23/255, green: 23/255, blue: 23/255))
      
            }
            
            if folkunkShow {
                ZStack{
                    Image("gritr_yubjing")
                                    .resizable()
                                    .frame( height: 178)
                                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                                    .ignoresSafeArea()
                    
                    Image("gritr_jianp")
                                    .resizable()
                                    .frame(width:30, height: 30)
                                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                                    .padding(.top,50)
                                    .padding(.leading,16)
                                    .onTapGesture {
                                        withAnimation{
                                            folkunkShow = false
                                        }
                                    }
                    
                    ZStack {
                                Circle()
                            .fill(Color(red: 234/255, green: 66/255, blue: 190/255).opacity(0.2))
                                    .frame(width: 76, height: 76)
                                    .scaleEffect(animatePulse ? 1.2 : 1)
                                    .animation(recorder.isRecording ?
                                               Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)
                                               : .default, value: animatePulse)
                                
                                Circle()
                                    .fill(Color(red: 234/255, green: 66/255, blue: 190/255))
                                    .frame(width: 60, height: 60)
                                
                                Image("gritr_voice")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                            }
                    .padding(.top,50)
                    .gesture(
                        LongPressGesture(minimumDuration: 0.3)
                            .sequenced(before: DragGesture(minimumDistance: 0))
                            .updating($fingerInside) { value, state, _ in
                                switch value {
                                case .first(true):
                                   
                                    state = true
                                    animatePulse = true
                                    recorder.startRecording()
                                case .second(true, let drag):
                                    
                                    if let drag = drag {
                                        let frame = CGRect(x: 0, y: 0, width: 76, height: 76)
                                        state = frame.contains(drag.location)
                                    }
                                default:
                                    break
                                }
                            }
                            .onEnded { value in
                                // 手指松开，停止动画和录音
                                animatePulse = false
                                if recorder.isRecording {
                                    
                                    if let result = recorder.stopRecording() {
                                        let fileURL = result.url
                                        let duration = result.duration
                                        
                                        if duration < 1 {
                                                       // 录音太短，丢弃
                                                       try? FileManager.default.removeItem(at: fileURL)
                                                       return
                                                   }

                                        let newMessage = ProvisatInfos(
                                            felickelId: SustainStorge.shared.flangerInfo.count + 1,
                                            rimionhText: "",
                                            temoveVoice: fileURL.path,
                                            nbtransTime: "\(duration)s",
                                            grgemoUserId: eslotanUserId,
                                            oxenuatoChatId: mgasivepChatId,
                                            moakernSendTime: {
                                                let df = DateFormatter()
                                                df.dateFormat = "hh:mm a"
                                                df.locale = Locale(identifier: "en_US_POSIX")
                                                return df.string(from: Date())
                                            }()
                                        )

                                        SustainStorge.shared.addAnogfinnfo(newMessage)
                                        loadDirectiInfo()
                                    }
                                }
                            }
                    )
                    
                }
                .frame(height: 178)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
                .transition(.move(edge: .bottom))
                
            }
            
    
        }.deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: drcisebeUser.hykingUserId){
            
        }
        .onTapGesture {
            eadroomField = nil
        }.onAppear{
            loadDirectiInfo()
        }.onDisappear {
            MurmuraWaveCore.shared.stop()
        }
        .onReceive(NotificationCenter.default.publisher(
            for: UIApplication.willResignActiveNotification)
        ) { _ in
            MurmuraWaveCore.shared.stop()
        }
    }

        

    func loadDirectiInfo(){
        apjambpInfos = SustainStorge.shared.flangerInfo.filter{
            $0.oxenuatoChatId == mgasivepChatId
        }
    }
}
