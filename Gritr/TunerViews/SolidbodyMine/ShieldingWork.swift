
import SwiftUI

struct ShieldingWork: View {
    let columns = [
        GridItem(.adaptive(minimum: 165), spacing: 13)
    ]
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
                            ForEach(0..<10) {index in
                                PickupDynamic()
                                }
                        }
                    }
                }
               
            }.padding(.horizontal,16)
        }
    }
}
