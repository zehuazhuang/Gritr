
import SwiftUI
import SwiftfulRouting

struct SignatureTaren: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
    let naitroceUserId : Int
    @Environment(\.router) var router
    @State private var coiltapUser: ReverbUsers = ReverbUsers.default
    @State private var searnePosts: [AvelguitarPosts] = []
    @State private var tutorialIs: Bool = false
    @State private var inneranReShow: Bool = false
    @State private var hespiritUserId: Int = -1
    let onUpdnter : () -> Void
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack(spacing:0){
                    HStack{
                        Button(action: {
                            onUpdnter()
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
                        Image("gritr_report")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .onTapGesture {
                                            withAnimation{
                                                inneranReShow = true
                                                hespiritUserId = naitroceUserId
                                            }
                                        }
                    }
                Spacer().frame(height: 30)
                ScrollView{
                    VStack(spacing:0){
                        Image(coiltapUser.strumAvatar)
                                        .resizable()
                                        .frame(width: 115, height: 115)
                                        .clipShape(Circle())
                        Spacer().frame(height: 16)
                        Text(coiltapUser.aidrivenName)
                                                .font(.system(size: 24, weight: .bold))
                                                .foregroundColor(.white)
                        Spacer().frame(height: 30)
                        
                        HStack{
                            Spacer()
                            VStack(spacing:4){
                                Text("\(coiltapUser.tpickingFans.count)")
                                                        .font(.system(size: 16, weight: .black))
                                                        .foregroundColor(.white)
                                Text("Followers")
                                                        .font(.system(size: 10, weight: .regular))
                                                        .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                            VStack(spacing:4){
                                Text("\(coiltapUser.rpickingFollow.count)")
                                                        .font(.system(size: 16, weight: .black))
                                                        .foregroundColor(.white)
                                Text("Following")
                                                        .font(.system(size: 10, weight: .regular))
                                                        .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                        }
                        Spacer().frame(height: 19)
                        HStack{
                            Button(action: {
                                SustainStorge.shared.tunheadpinFol(from: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId, to: naitroceUserId)
                                
                                updArdtUser()
                                            }) {
                                                Text(tutorialIs ? "- Unfollow" : "+ Follow")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                                                    .frame(width: 165, height: 52)
                                                    
                                            }
                                            .background(
                                                tutorialIs ?
                                                Color(red: 204/255, green: 204/255, blue: 204/255) :Color(red: 234/255, green: 66/255, blue: 190/255)
                                            )
                                            .cornerRadius(60)
                            
                            Button(action: {
                                let finnluChatId = SustainStorge.shared
                                    .forgePalmuteThread(to: naitroceUserId)
                                
                                router.showScreen(.fullScreenCover) { _ in
                                    ToastHost {
                                        MahoganyChat(mgasivepChatId: finnluChatId, drcisebeUser: coiltapUser, onUpdaSereni: {
                                            
                                        })
                                    }
                                        }
                                
                                            }) {
                                                HStack{
                                                    Image("gritr_liao")
                                                                    .resizable()
                                                                    .frame(width: 28, height: 28)
                                                    
                                                    Text("Chat")
                                                        .font(.system(size: 16, weight: .bold))
                                                        .foregroundColor(.black)
                                                        
                                                }.frame(width: 165, height: 52)
                                                    
                                            }
                                            .background(
                                                Color.white
                                            )
                                            .cornerRadius(60)
                        }
                        Spacer().frame(height: 30)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(searnePosts,id: \.alternatPostId) {item in
                                PickupDynamic(warmthPost: item, honeampCheck: false, inpuredReort: {
                                    withAnimation{
                                        inneranReShow = true
                                        hespiritUserId = item.gerstyleUserId
                                    }
                                })
                                    .onTapGesture {
                                        router.showScreen(.fullScreenCover) { _ in
                                            PluckingVDetails(teturalPostId: item.alternatPostId,
                                                             luthierUrl: item.staccatoDiz, onUpdaEnilme: {}
                                            )
                                            }
                                    }
                                }
                        }
                        
                        
                        
                    }
                }
            }.padding(.horizontal,16)
            
     
        }
        .deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: hespiritUserId){}
        .onAppear{
            updArdtUser()
            
            searnePosts = SustainStorge.shared.getCtivePosts(by: naitroceUserId)
        }
    }
    
    func updArdtUser(){
        coiltapUser = SustainStorge.shared.reverbUsers.first(where: {
            $0.hykingUserId == naitroceUserId
        }) ?? ReverbUsers.default
        withAnimation{
            tutorialIs = coiltapUser.tpickingFans.contains(SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId)
        }
        
    }
}
