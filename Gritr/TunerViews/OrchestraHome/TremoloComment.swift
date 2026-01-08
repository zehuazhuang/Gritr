import SwiftUI

struct TremoloComment: View {
    @State private var windingContent: String = ""
    @FocusState private var saddleField: Field?
    enum Field: Hashable {
        case windingContent
    }
    @Binding var adcaseShow: Bool
    let tedmoderPostId : Int
    @State private var sktopampComments: [IalharmonComments] = []
    @State private var inneranReShow: Bool = false
    @State private var piroueUserId: Int = -1
    
    var body: some View {
        ZStack{
                    Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
                            .onTapGesture {
                                adcaseShow = false
                            }
            
            VStack{
                Spacer()
                ZStack{
                        Image("gritr_com_backbj")
                                        .resizable()
                                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                                        .ignoresSafeArea()
                    ScrollView{
                        VStack(spacing:22){
                            Spacer().frame(height: 2)
                            HStack{
                                Text("Comments")
                                                        .font(.system(size: 28, weight: .bold))
                                                        .foregroundColor(.white)
                                Spacer()
                            }
                            ForEach(sktopampComments,id: \.bentwohdCommId){item in
                                let roundinUser = SustainStorge.shared.getRadiusUser(by: item.pmeteroUserId)
                                HStack(alignment:.top,spacing:15){
                                    Image(roundinUser.strumAvatar)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                            )
                                        VStack(alignment: .leading,spacing: 5){
                                            Text(roundinUser.aidrivenName)
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
                                                            inneranReShow = true
                                                            piroueUserId = item.pmeteroUserId
                                                        }
                                    }
                            }
                        }
                    }.padding(.horizontal,16)
                    
                    VStack{
                        Spacer()
                        VStack{
                           
                                ZStack(alignment: .leading) {
                                    if windingContent.isEmpty {
                                        Text("Say something")
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
                                                        idartifiType: 1,
                                                        seventhcText: windingContent,
                                                        pmeteroUserId: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId,
                                                        cadenceZuopId: tedmoderPostId)
                                                )
                                                windingContent = ""
                                                loadSignalnoiseComment()
                                            }
                                        }

                                }.frame(height: 40)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(60)
                                    .padding(.horizontal,16)
                        }.frame(height: 65)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 23/255, green: 23/255, blue: 23/255))
                    }
                    
                }.frame(height: 470)
                    .frame(maxWidth: .infinity)
            }
           
        }.onAppear{
            loadSignalnoiseComment()
        }.deondeReportOverlay(isRumchaba: $inneranReShow, piroueUserId: piroueUserId){
            loadSignalnoiseComment()
        }
       
    }
    func loadSignalnoiseComment(){
        sktopampComments = SustainStorge.shared.acompodComments.filter{
            $0.idartifiType == 1 && $0.cadenceZuopId == tedmoderPostId
        }
    }
}
