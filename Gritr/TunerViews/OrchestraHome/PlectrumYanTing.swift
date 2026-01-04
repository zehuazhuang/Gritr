
import SwiftUI

struct PlectrumYanTing: View {
    @State private var windingContent: String = ""
    @FocusState private var saddleField: Field?
    enum Field: Hashable {
        case windingContent
    }
    @State private var zopickupShowGift: Bool = false
    @State private var etalslideShowFu: Bool = false
    @State private var modelingShowRech: Bool = false
    @State private var autowahShowClose: Bool = true
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
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
                    Spacer()
                    Image("gritr_report")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                }.padding(.horizontal,16)
                    .padding(.bottom,30)
                ZStack{
                    Circle()
                        .fill(Color(red: 234/255, green: 66/255, blue: 190/255,opacity: 0.2))
                        .frame(width: 135,height: 135)
                    Image("gritr_icon")
                        .resizable()
                        .frame(width: 115, height: 115)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                        )
                }
                .frame(width: 165,height: 165)
                .background( Color(red: 234/255, green: 66/255, blue: 190/255,opacity: 0.2))
                .clipShape(Circle())
                Spacer().frame(height: 12)
                Text("Ciarian")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                Spacer().frame(height: 8)
                Button(action: {
                                   
                               }) {
                                   Text("+ Follow")
                                       .font(.system(size: 14, weight: .medium))
                                       .foregroundColor(.white)
                                       .frame(width: 90, height: 34)
                               }
                               .background(
                                Color(red: 234/255, green: 66/255, blue: 190/255)
                               )
                               .cornerRadius(60)
                
                Spacer().frame(height: 30)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.1))
                        .ignoresSafeArea()
                    
                    ScrollView{
                        VStack(spacing:20){
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
                        }.padding(.leading,16)
                            .padding(.trailing,26)
                         .padding(.top,33)
                    }
                    
                    VStack{
                        Spacer()
                        VStack{
                            HStack(spacing:12){
                                ZStack(alignment: .leading) {
                                    if windingContent.isEmpty {
                                        Text("Enter...")
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
                                
                                Image("gritr_gift")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                            }.padding(.horizontal,16)
                            
                        }.frame(height: 65)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 23/255, green: 23/255, blue: 23/255))
                    }
                }
            }
            
            if zopickupShowGift {
                TuningpegGift()
                    .ignoresSafeArea()
            }
            if etalslideShowFu {
                ArpeggioFu()
            }
            if modelingShowRech {
                CabinetRecharge()
            }
            if autowahShowClose {
                FootswitchClose()
            }
        }.onTapGesture {
            saddleField = nil
        }
    }
}


