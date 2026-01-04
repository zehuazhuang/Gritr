import SwiftUI



    struct FretwearUpload: View {
        @State private var buckerName: String = ""
        @State private var volumeContent: String = ""
        @FocusState private var ballendField: Field?
        enum Field: Hashable {
            case buckerName, volumeContent
        }
        var body: some View {
            ZStack{
                Image("gritr_backg")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .ignoresSafeArea()
                
                    VStack{
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
                            Spacer()
                            Text("Upload")
                                .font(.system(size: 36, weight: .black))
                                .foregroundColor(.white)
                                .kerning(1.2)
                            Spacer()
                            Spacer().frame(width: 40, height: 40)
                            
                           
                        }
                        ScrollView{
                            VStack(alignment:.leading,spacing: 16){
                                Spacer().frame( height: 30)
                                Text("Video:")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                ZStack(alignment: .leading) {
                                    Button(action: {
                                                       
                                                   }) {
                                                       Image("gritr_add")
                                                                       .resizable()
                                                                       .frame(width: 20, height: 20)
                                                           .frame(width: 60, height: 60)
                                                           
                                                   }
                                                   .background(
                                                    Color.white.opacity(0.2)
                                                   )
                                                   .clipShape(Circle())
                                                  
                                    
                                }
                                .frame(height: 240)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(20)
                                .padding(.bottom,14)
                                Text("Copywriting:")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
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
                                }) {
                                    Text("Upload")
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
                        }
                    }.padding(.horizontal,16)
              
            }.onTapGesture {
                ballendField = nil
            }
        }
    }
