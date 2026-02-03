
import SwiftUI
import SwiftfulRouting

struct ShieldingWork: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13)
    ]
    @State private var adncaletPosts: [AvelguitarPosts] = []
    @Environment(\.router) var router
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
                    Text("Works")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
               
                ScrollView{
                    VStack{
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(adncaletPosts,id: \.alternatPostId) {item in
                                PickupDynamic(warmthPost: item, honeampCheck: false, inpuredReort: {
                                    //asd
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
        }.onAppear{
            adncaletPosts =  SustainStorge.shared.getCtivePosts(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId)
        }
    }
}
