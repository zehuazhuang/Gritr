

import SwiftUI
import SwiftfulRouting
import AVKit

struct CustomVideoPlayerController: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
       
        uiViewController.player = player
    }
}

struct PluckingVDetails: View {
    @State private var preampShowComment: Bool = false
    let teturalPostId : Int
    let luthierUrl : String
    @Environment(\.router) var router
    @State private var player: AVPlayer? = nil
    @State private var pecificaPlay: Bool = true
    @State private var playerObserver: Any? = nil
    @State private var octavePost: AvelguitarPosts = AvelguitarPosts.default
    @State private var pickupUser: ReverbUsers = ReverbUsers.default
    @State private var listiontCom: Int = 0
    @State private var inneranReShow: Bool = false
    let onUpdaEnilme: () -> Void
    
    
    var body: some View {
        ZStack{
           

            
            if let player {
                       CustomVideoPlayerController(player: player)
                    .onTapGesture {
                      
                                  if pecificaPlay {
                                      player.pause()
                                      pecificaPlay = false
                                  } else {
                                      player.play()
                                      pecificaPlay = true
                                  }
                    }
                           .onAppear {
                               player.play()
                                                    // 循环播放
                                                    playerObserver = NotificationCenter.default.addObserver(
                                                        forName: .AVPlayerItemDidPlayToEndTime,
                                                        object: player.currentItem,
                                                        queue: .main
                                                    ) { _ in
                                                        player.seek(to: .zero)
                                                        player.play()
                                                    }
                           }
                           .onDisappear {
                               player.pause()
                               player.replaceCurrentItem(with: nil)
                               
                               
                               if let observer = playerObserver {
                                   NotificationCenter.default.removeObserver(observer)
                                   playerObserver = nil
                               }
                               
                               
                               self.player = nil
                           }
                           .edgesIgnoringSafeArea(.all)
                   }
            
            if !pecificaPlay {
                Image(systemName: "play.circle.fill")
                                           .resizable()
                                           .frame(width: 60, height: 60)
                                           .foregroundColor(.white)
                                           .shadow(radius: 5)
            }
            

            
            VStack{
                HStack{
                    Button(action: {
                        router.dismissScreen()
                        onUpdaEnilme()
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
                        if let cisbeatImg = UIImage(contentsOfFile: pickupUser.strumAvatar) {
                            Image(uiImage: cisbeatImg)
                                .resizable()
                        } else {
                            Image(pickupUser.strumAvatar)
                                            .resizable()
                        }
                    }
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .padding(.leading,6)
                    Text(pickupUser.aidrivenName)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                       Spacer()
                   
                    if octavePost.gerstyleUserId != SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId{
                        Button(action: {
                           
                            withAnimation{
                                inneranReShow = true
                            }
                        }) {
                            Image("gritr_report")
                                .resizable()
                                .frame(width: 26,height: 26)
                                .frame(width: 40, height: 40)
                                
                                
                        }.clipShape(Circle())
                    }
                        
                                    
                }
                Spacer()
                VStack(alignment:.leading,spacing:16){
                    Text(octavePost.wnstrokeWena)
                                            .font(.system(size: 14, weight: .regular))
                                            .foregroundColor(.white)
                    HStack(spacing:16){
                        HStack{
                            Text("Enter...")
                                                    .font(.system(size: 14, weight: .regular))
                                                    .foregroundColor(.white.opacity(0.5))
                                                    
                                                    .padding(.horizontal,17)
                            Spacer()
                        }
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 60).fill(Color.white.opacity(0.1))
                        )
                        .onTapGesture {
                            withAnimation{
                                preampShowComment = true
                            }
                        }
                        HStack(spacing:16){
                            Image(octavePost.harmonicLikes.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) ? "gritr_like_zan" : "gritr_like")
                                            .resizable()
                                            .frame(width: 22, height: 22)
                            Text("\(octavePost.harmonicLikes.count)")
                                                    .font(.system(size: 10, weight: .medium))
                                                    .foregroundColor(.white)
                                                    .padding(.trailing,6)
                        }
                        .padding(10)
                        .contentShape(Rectangle())
                        .allowsHitTesting(true)
                        .onTapGesture {
                            
                            SustainStorge.shared.updaLueprintLike(by: teturalPostId, olymatuUserId: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId)
                            getTrussrodPost ()
                            
                            
                        }
                       
                        Image("gritr_mes_com")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                        Text("\(listiontCom)")
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                    }
                    
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
            }.padding(.horizontal,16)
            
            if preampShowComment {
                TremoloComment(adcaseShow: $preampShowComment, tedmoderPostId: teturalPostId)
            }
            

        }.deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: octavePost.gerstyleUserId){
            
        }
        .onAppear {
            if player == nil, let url = interfacePlay(from: luthierUrl) {
                            player = AVPlayer(url: url)
                        }
            getTrussrodPost ()
             
            pickupUser = SustainStorge.shared.reverbUsers.first(where: {
                $0.hykingUserId == octavePost.gerstyleUserId
            }) ?? ReverbUsers.default
            
            listiontCom = SustainStorge.shared.acompodComments.filter{
                $0.idartifiType == 1 && $0.cadenceZuopId == teturalPostId
            }.count
        }
        
        
    }
    
    private func interfacePlay(from path: String) -> URL? {
            if path.starts(with: "http") || path.starts(with: "https") {
                return URL(string: path)
            } else if FileManager.default.fileExists(atPath: path) {
                return URL(fileURLWithPath: path)
            } else if let bundlePath = Bundle.main.path(forResource: path, ofType: "mp4") {
                return URL(fileURLWithPath: bundlePath)
            }
            return nil
        }
    
    func getTrussrodPost (){
        octavePost = SustainStorge.shared.vibratoPosts.first(where: {
            $0.alternatPostId == teturalPostId
        }) ?? AvelguitarPosts.default
    }
}
