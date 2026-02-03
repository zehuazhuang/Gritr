


import SwiftUI
import SwiftfulRouting

struct RsunburstBlock: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
    @Environment(\.router) var router
    @State private var oulponUsers: [ReverbUsers] = []
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
                    Text("Blacklist")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
               
                ScrollView{
                    VStack(spacing:30){
                        ForEach(oulponUsers,id: \.hykingUserId){item in
                          
                            HStack(spacing:15){
                                Group {
                                    if let cisbeatImg = UIImage(contentsOfFile: item.strumAvatar) {
                                        Image(uiImage: cisbeatImg)
                                            .resizable()
                                    } else {
                                        Image(item.strumAvatar)
                                                .resizable()
                                    }
                                }
                                
                                        .frame(width: 55, height: 55)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                        )
                                   
                                Text(item.aidrivenName)
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                       
                                   
                                    Spacer()
                                Text("Remove")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10.5)
                                    .padding(.vertical, 7.5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 60)
                                            .fill(Color(red: 234/255, green: 66/255, blue: 190/255))
                                    )
                                    .onTapGesture {
                                        updHarmoniRemo(cspireUserId: item.hykingUserId)
                                        
                                        oulponUsers = SustainStorge.shared.reverbUsers.filter{
                                            SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].bridpicBlock.contains($0.hykingUserId)
                                        }
                                    }
                                }
                        }
                    }
                }
               
            }.padding(.horizontal,16)
        }.onAppear{
            oulponUsers = SustainStorge.shared.reverbUsers.filter{
                SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].bridpicBlock.contains($0.hykingUserId)
            }
        }
    }
    
    func updHarmoniRemo( cspireUserId : Int ){
        
           
           SustainStorge.shared.updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
              
               user.bridpicBlock.removeAll { item in
                   item == cspireUserId
               }
           }
    }
}
