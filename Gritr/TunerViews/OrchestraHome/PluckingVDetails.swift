

import SwiftUI

struct PluckingVDetails: View {
    @State private var preampShowComment: Bool = true
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
                }
                Spacer()
                VStack(alignment:.leading,spacing:16){
                    Text("The collision between my fingertips and the strings is a moment of healing that belongs only to me")
                                            .font(.system(size: 14, weight: .regular))
                                            .foregroundColor(.white)
                    HStack(spacing:16){
                        HStack{
                            Text("Enter...")
                                                    .font(.system(size: 14, weight: .regular))
                                                    .foregroundColor(.white.opacity(0.5))
                                                    
                                                    .padding(.horizontal,17)
                            Spacer()
                        }
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 60).fill(Color.white.opacity(0.1))
                        )
                        Image("gritr_like")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                        Text("0")
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                                                .padding(.trailing,6)
                        Image("gritr_mes_com")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                        Text("0")
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                    }
                    
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
            }.padding(.horizontal,16)
            
            if preampShowComment {
                TremoloComment()
            }
        }
    }
}
