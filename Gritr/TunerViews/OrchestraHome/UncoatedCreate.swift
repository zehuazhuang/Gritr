

import SwiftUI
import SwiftfulRouting

    struct UncoatedCreate: View {
        @State private var buckerName: String = ""
        @State private var volumeContent: String = ""
        @FocusState private var ballendField: Field?
        enum Field: Hashable {
            case buckerName, volumeContent
        }
        @Environment(\.router) var router
        let onCreated: (VoicingRooms) -> Void
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
                            Text("Create")
                                .font(.system(size: 36, weight: .black))
                                .foregroundColor(.white)
                                .kerning(1.2)
                            Spacer()
                            Spacer().frame(width: 40, height: 40)
                            
                           
                        }
                       
                            VStack(alignment:.leading,spacing: 16){
                                Spacer().frame( height: 50)
                                Text("Room Name:")
                                                        .font(.system(size: 18, weight: .bold))
                                                        .foregroundColor(.white)
                                ZStack(alignment: .leading) {
                                    if buckerName.isEmpty {
                                        Text("Enter the room name")
                                            .foregroundColor(.white.opacity(0.5))
                                            .padding(.leading, 16)
                                    }
                                    
                                    TextField("", text: $buckerName)
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .focused($ballendField, equals: .buckerName)

                                }
                                .frame(height: 52)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(20)
                                .padding(.bottom,14)
                                HStack{
                                    Text("Content:")
                                                            .font(.system(size: 18, weight: .bold))
                                                            .foregroundColor(.white)
                                    Spacer()
                                   
                                        
                                }
                                ZStack(alignment: .topLeading) {
                                    if volumeContent.isEmpty {
                                        Text("Enter...")
                                            .foregroundColor(.white.opacity(0.5))
                                            .padding(.leading, 16)
                                            .padding(.top, 12)
                                    }
                                    
                                    TextEditor(text: $volumeContent)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                        .frame(height: 149)
                                        .background(Color.clear)
                                        .focused($ballendField, equals: .volumeContent)
                                        .scrollContentBackground(.hidden)
                                }
                                .frame(height: 149)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(20)
                                .padding(.bottom,14)
                                
                                Spacer()
                                Button(action: {
                                    if(buckerName != "" && volumeContent != ""){
                                        
                                        let actoryUser = SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex]
                                        
                                        let newRoducti = VoicingRooms(
                                            ypickingRoomId: SustainStorge.shared.chromaticRooms.count+1,
                                            strumminUserId: actoryUser.hykingUserId,
                                            economJies: volumeContent,
                                            intervalName: buckerName,
                                            asebendBeiYin: "",
                                            orscaleImg: actoryUser.strumAvatar,
                                            hammeronLook: 0,
                                            pentatoniHot: 0
                                        )
                                        SustainStorge.shared.addPracticeaRoom(
                                            newRoducti
                                            )
                                       
                                        onCreated(newRoducti)
                                        router.dismissScreen()
                                    }
                                    
                                               }) {
                                                   Text("Create")
                                                       .font(.system(size: 18, weight: .bold))
                                                       .foregroundColor(.black)
                                                       .frame(height: 50)
                                                       .frame(maxWidth: .infinity)
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
                                               .padding(.bottom,35)
                                           
                            }.frame(maxWidth: .infinity,alignment: .leading)
                        
                    }.padding(.horizontal,16)
              
            }.onTapGesture {
                ballendField = nil
            }
        }
    }
