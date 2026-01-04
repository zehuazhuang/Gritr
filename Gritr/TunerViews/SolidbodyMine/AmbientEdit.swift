



import SwiftUI

struct AmbientEdit: View {
    @State private var picpokName: String = ""
    @FocusState private var knowitchbField: Field?
    enum Field: Hashable {
        case picpokName
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
                    Text("Edit")
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .kerning(1.2)
                    Spacer()
                    Spacer().frame(width: 40, height: 40)
                }
                .padding(.bottom,23)
               
                VStack(spacing:16){
                        Spacer().frame(height: 30)
                        ZStack(alignment:.bottomTrailing){
                            Image("gritr_icon")
                                .resizable()
                                .frame(width: 115, height: 115)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                )
                            Image("gritr_shanga")
                                .resizable()
                                .frame(width: 34, height: 34)
                        }
                        Spacer().frame(height: 50)
                        HStack{
                            Text("Name:")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                            Spacer()
                        }
                        ZStack(alignment: .leading) {
                            if picpokName.isEmpty {
                                Text("Enter username")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                            
                            TextField("", text: $picpokName)
                                .foregroundColor(.white)
                                .padding(16)
                                .focused($knowitchbField, equals: .picpokName)

                        }
                        .frame(height: 52)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                        .padding(.bottom,14)
                
                        Spacer()
                        Button(action: {
                                           
                                       }) {
                                           Text("Save")
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
                    }
               
            }.padding(.horizontal,16)
        }.onTapGesture {
            knowitchbField = nil
        }
    }
}

