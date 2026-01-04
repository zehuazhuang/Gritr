

import SwiftUI
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool
}
struct MahoganyChat: View {
    @State private var upstrokeContent: String = ""
    @FocusState private var eadroomField: Field?
    enum Field: Hashable {
        case upstrokeContent
    }
    @State private var messages: [Message] = [
            Message(text: "Hello!", isCurrentUser: false),
            Message(text: "Hi, how are you?", isCurrentUser: true),
            Message(text: "I'm good, thanks!", isCurrentUser: false)
        ]
    @State private var folkunkShow: Bool = true
    
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
                    Image("gritr_icon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .padding(.leading,6)
                    Text("Daniele")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                       Spacer()
                    Image("gritr_report")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                }.padding(.horizontal,16)
                    .padding(.bottom,30)
                ScrollViewReader { proxy in
                                    ScrollView {
                                        LazyVStack(spacing: 30) {
                                            ForEach(messages) { msg in
                                                HStack {
                                                    if msg.isCurrentUser {
                                                        Spacer()
                                                    }else{
                                                        Image("gritr_icon")
                                                                        .resizable()
                                                                        .frame(width: 40, height: 40)
                                                                        .clipShape(Circle())
                                                    }
                                                    
                                                    Text(msg.text)
                                                        .padding(12)
                                                        .background(msg.isCurrentUser ?  Color(red: 234/255, green: 66/255, blue: 190/255) : Color.white.opacity(0.1))
                                                        .foregroundColor(.white)
                                                        .cornerRadius(16)
                                                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: msg.isCurrentUser ? .trailing : .leading)
                                                    
                                                    if !msg.isCurrentUser {
                                                        Spacer()
                                                    }else{
                                                        Image("gritr_icon")
                                                                        .resizable()
                                                                        .frame(width: 40, height: 40)
                                                                        .clipShape(Circle())
                                                    }
                                                }
                                                .padding(.horizontal, 16)
                                            }
                                        }
                                        .onChange(of: messages.count) { _ in
                                            // 滚动到底部
                                            if let last = messages.last {
                                                proxy.scrollTo(last.id, anchor: .bottom)
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

                        }.frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(60)
                        
                        Button(action: {
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
                    
                    ZStack{
                        Circle()
                            .fill(Color(red: 234/255, green: 66/255, blue: 190/255).opacity(0.2))
                            .frame(width: 76, height: 76)
                        Circle()
                            .fill(Color(red: 234/255, green: 66/255, blue: 190/255))
                            .frame(width: 60, height: 60)
                        
                        Image("gritr_voice")
                            .resizable()
                            .frame(width: 36,height: 36)
                    }.padding(.top,50)
                    
                }
                .frame(height: 178)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
                
            }
        }.onTapGesture {
            eadroomField = nil
        }
    }
}
