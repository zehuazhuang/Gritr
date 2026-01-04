import SwiftUI

struct TremoloComment: View {
    @State private var windingContent: String = ""
    @FocusState private var saddleField: Field?
    enum Field: Hashable {
        case windingContent
    }
    var body: some View {
        ZStack{
            Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
            
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
                            ForEach(0..<2){index in
                              
                                HStack(alignment:.top,spacing:15){
                                        Image("gritr_icon")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                            )
                                        VStack(alignment: .leading,spacing: 5){
                                            Text("Username")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white)
                                            Text("You play the guitar very well")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.white.opacity(0.5))
                                        }.padding(.top,5)
                                        Spacer()
                                        Image("gritr_report")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .padding(.top,5)
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
           
        }
    }
}
