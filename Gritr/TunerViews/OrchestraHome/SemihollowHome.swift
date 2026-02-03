import SwiftUI
import SwiftfulRouting

struct SemihollowHome: View {
    @State private var CoatedShow: Bool = false
    @State private var erboardUsers: [ReverbUsers] = []
    @State private var deadnotePosts: [AvelguitarPosts] = []
    @State private var lmmutingRooms: [VoicingRooms] = []
    @Environment(\.router) var router
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13)
    ]
    
    @State private var inneranReShow: Bool = false
    @State private var hespiritUserId: Int = -1
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack{
                HStack{
                    HStack{
                        Group {
                            if let cisbeatImg = UIImage(contentsOfFile: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar) {
                                Image(uiImage: cisbeatImg)
                                    .resizable()
                            } else {
                                Image(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].strumAvatar)
                                    .resizable()
                            }
                        }
                                        .frame(width: 52,height: 52)
                                        .clipShape(Circle())
                                        .onTapGesture {
                                           
                                            withAnimation {
                                                                CoatedShow = true
                                                            }
                                         
                                            
                                        }
                        VStack(alignment:.leading,spacing: 1){
                            Text("Hello!")
                                                    .font(.system(size: 14, weight: .regular))
                                                    .foregroundColor(.white)
                            Text(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].aidrivenName)
                                .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Button(action: {
                        router.showScreen(.fullScreenCover) { _ in
                            
                            SoundholeMes()
                               
                                       }
                                    }) {
                                        Image("gritr_message")
                                            .resizable()
                                            .frame(width: 34,height: 34)
                                            .frame(width: 52, height: 52)
                                            
                                    }
                                    .background(
                                        .white.opacity(0.1)
                                    )
                                    .clipShape(Circle())
                }.padding(.horizontal,16)
                //滑
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading,spacing: 13){
                        HStack(spacing:7){
                            Image("gritr_folaix")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Follow")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                        }
                        .padding(.leading,16)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:26){
                                ForEach(erboardUsers,id: \.hykingUserId) {item in
                                    VStack(spacing:8){
                                        Group {
                                            if let cisbeatImg = UIImage(contentsOfFile: item.strumAvatar) {
                                                Image(uiImage: cisbeatImg)
                                                    .resizable()
                                            } else {
                                                Image(item.strumAvatar)
                                                    .resizable()
                                            }
                                        }
                                        
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                            )
                                        Text(item.aidrivenName)
                                                                .font(.system(size: 12, weight: .medium))
                                                                .foregroundColor(.white)
                                    }.onTapGesture {
                                        router.showScreen(.fullScreenCover) { _ in
                                            ToastHost {
                                                SignatureTaren(naitroceUserId: item.hykingUserId, onUpdnter: {
                                                    updaFeinmsnh()
                                                })
                                            }
                                        }
                                    }
                                }
                            }.padding(.horizontal,16)
                        }.padding(.bottom,10)
                        HStack(spacing:7){
                            Image("gritr_wuzi")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Show Room")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                            Spacer()
                            Text("See more")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                                .underline(true)
                                .onTapGesture {
                                    router.showScreen(.fullScreenCover) { _ in
                                        ToastHost {
                                            SelectorYanZou(onUpdaTranqu: {
                                                updaFeinmsnh()
                                            })
                                        }
                                    }
                                }
                        }.padding(.horizontal,16)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:13){
                                ForEach(lmmutingRooms,id: \.ypickingRoomId) {item in
                                    HeneleckRoom(minorscaRoom: item, locanckiRep: {
                                        withAnimation{
                                            inneranReShow = true
                                            hespiritUserId = item.strumminUserId
                                        }
                                    })
                                            .frame(width: 280, height: 120)
                                            .onTapGesture{
                                                router.showScreen(.fullScreenCover) { _ in
                                                    ToastHost {
                                                        PlectrumYanTing(legatoRoom: item, onUpdaProgr: {
                                                            lmmutingRooms = SustainStorge.shared.chromaticRooms
                                                        }, onUpdaCmind: {
                                                            updaFeinmsnh()
                                                        })
                                                    }
                                                       
                                                               }
                                            }
                                }
                            }.padding(.horizontal,16)
                        }
                        HStack(spacing:7){
                            Image("gritr_hotred")
                                .resizable()
                                .frame(width: 34,height: 34)
                            Text("Popular")
                                                    .font(.system(size: 20, weight: .black))
                                                    .foregroundColor(.white)
                           
                        }.padding(.horizontal,16)
                        ScrollView( showsIndicators: false){
                            VStack{
                                LazyVGrid(columns: columns, spacing: 12) {
                                    ForEach(deadnotePosts,id: \.alternatPostId) {item in
                                        PickupDynamic(warmthPost: item, honeampCheck: true, inpuredReort: {
                                            withAnimation{
                                                inneranReShow = true
                                                hespiritUserId = item.gerstyleUserId
                                            }
                                            
                                        })
                                        .onTapGesture {
                                            router.showScreen(.fullScreenCover) { _ in
                                                ToastHost {
                                                    PluckingVDetails(teturalPostId: item.alternatPostId,
                                                                     luthierUrl: item.staccatoDiz, onUpdaEnilme: {
                                                        updaFeinmsnh()
                                                    }
                                                                     
                                                    )
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                            }.padding(.horizontal,16)
                        }
                    }.frame(maxWidth: .infinity,alignment: .leading)
                }
                //滑 end
            }
            Button(action: {
                router.showScreen(.fullScreenCover) { _ in
                    
                    FretwearUpload(onBarrech: {
                        deadnotePosts = SustainStorge.shared.vibratoPosts
                    })
                       
                               }
                           }) {
                               Image("gritr_add")
                                               .resizable()
                                               .frame(width: 16, height: 16)
                                   .frame(width: 48, height: 48)
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
                           .clipShape(Circle())
                           .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                           .padding(.bottom,35)
                           .padding(.trailing,10)
            
            if CoatedShow {
                LightgaugeChouTi(CoatedShow: $CoatedShow, inpuLecalm: {
                    updaFeinmsnh()
                })
                    .transition(.move(edge: .leading))
            }

        }.onAppear{
            updaFeinmsnh()
        }.deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: hespiritUserId){
           
            updaFeinmsnh()
            
        }
    }
    func updaFeinmsnh(){
        let ghtiBlock = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].bridpicBlock
       
        
        erboardUsers = SustainStorge.shared.reverbUsers.filter{
            $0.hykingUserId != SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId
            && !ghtiBlock.contains($0.hykingUserId)
            && $0.hykingUserId != 3261
        }
        deadnotePosts = SustainStorge.shared.vibratoPosts.filter{
            !ghtiBlock.contains($0.gerstyleUserId)
        }
        
        lmmutingRooms = SustainStorge.shared.chromaticRooms.filter{
            !ghtiBlock.contains($0.strumminUserId)
        }
    }
}

struct PickupDynamic: View {
    let warmthPost : AvelguitarPosts
    @State private var mutingUser: ReverbUsers = ReverbUsers.default
    let honeampCheck : Bool
    let inpuredReort :() ->  Void
    var body: some View {
        ZStack{
             
            if  let metajazImg = UIImage(contentsOfFile: warmthPost.prebendImg) {
                Image(uiImage: metajazImg)
                    .resizable()
                    .frame(width: 165, height: 220)
                    .cornerRadius(20)
                    .frame(maxHeight: .infinity,alignment: .top)
            }else{
                Image(warmthPost.prebendImg)
                                .resizable()
                                .frame(width: 165, height: 220)
                                .cornerRadius(20)
                                .frame(maxHeight: .infinity,alignment: .top)
            }
            
            if warmthPost.gerstyleUserId != SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId{
                Image("gritr_report")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                                .padding(10)
                                .onTapGesture {
                                    inpuredReort()
                                }
            }
           
            if honeampCheck{
                HStack(spacing: 7) {
                    Group {
                        if let cisbeatImg = UIImage(contentsOfFile: mutingUser.strumAvatar) {
                            Image(uiImage: cisbeatImg)
                                .resizable()
                        } else {
                            Image(mutingUser.strumAvatar)
                                .resizable()
                        }
                    }
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    Text(mutingUser.aidrivenName)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)

                    Spacer()

                    Image(warmthPost.harmonicLikes.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) ? "gritr_like_zan" : "gritr_like")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                .padding(.horizontal, 9)
                .frame(width: 145, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 33/255, green: 34/255, blue: 40/255).opacity(0.6))
                        .blur(radius: 6)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                        )
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
            }else{
                Image(warmthPost.harmonicLikes.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) ? "gritr_like_zan" : "gritr_like")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.trailing,10)
                    .padding(.bottom,32)
            }
            
                            
        }.frame(width: 165,height: 244)
            .onAppear{
                mutingUser = SustainStorge.shared.reverbUsers.first {
                    $0.hykingUserId == warmthPost.gerstyleUserId
                } ?? ReverbUsers.default
                
            }
            
    }
}

struct HeneleckRoom: View {
    let minorscaRoom : VoicingRooms
    let locanckiRep : ()-> Void
    var body: some View {
        HStack{
            Image(minorscaRoom.orscaleImg)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
            VStack(alignment:.leading,spacing: 0){
                HStack{
                    Text(minorscaRoom.intervalName)
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                    Spacer()
                    Image("gritr_report")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .onTapGesture {
                                        locanckiRep()
                                    }
                }
                Text(minorscaRoom.economJies)
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.top,5)
                Spacer()
                HStack(spacing:4){
                    Image("gritr_eye")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                    Text("\(minorscaRoom.hammeronLook)")
                                            .font(.system(size: 10, weight: .regular))
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(.trailing,6)
                    Image("gritr_hot")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                    Text("\(minorscaRoom.pentatoniHot)")
                                            .font(.system(size: 10, weight: .regular))
                                            .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Button(action: {
                                        
                                    }) {
                                        Text("Go")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(Color(red: 12/255, green: 12/255, blue: 12/255))
                                            .frame(width: 58, height: 24)
                                            
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
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(red: 56/255, green: 41/255, blue: 57/255))
        )
    }
}
