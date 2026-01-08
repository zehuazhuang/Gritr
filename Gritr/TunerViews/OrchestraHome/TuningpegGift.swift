import SwiftUI

struct FactoryGift: Identifiable {
    let id: String
    let laminateImg: String
    let solidwoodPop: Int
    let lacquerGood: Int
}

struct TuningpegGift: View {
    @State private var etalslideShowFu: Bool = false
    @Binding var backlineShow: Bool
    let ineagiUser : ReverbUsers
    @State private var alderHot: Int = 0
    let factoryGifts: [FactoryGift] = [
        FactoryGift(
            id: "1",
            laminateImg: "gritr_gift_1",
            solidwoodPop: 1,
            lacquerGood: 50
        ),
        FactoryGift(
            id: "2",
            laminateImg: "gritr_gift_2",
            solidwoodPop: 3,
            lacquerGood: 100
        ),
        FactoryGift(
            id: "3",
            laminateImg: "gritr_gift_3",
            solidwoodPop: 5,
            lacquerGood: 150
        ),
        FactoryGift(
            id: "4",
            laminateImg: "gritr_gift_4",
            solidwoodPop: 8,
            lacquerGood: 200
        )
    ]
    @State private var pruceSelect: Int = -1
    @Environment(\.router) var router
    let onEdrill : (FactoryGift) -> Void
    var body: some View {
        ZStack{
            Color.black
                            .opacity(0.45)
                            .ignoresSafeArea()
                            .onTapGesture {
                                backlineShow = false
                            }
                           
            VStack{
                Spacer()
                ZStack{
                    Image("gritr_gift_backg")
                                                .resizable()
                                                .frame(height: 297)
                                                .frame(maxWidth: .infinity)
                    VStack(spacing:15){
                        HStack(spacing:8){
                            Text("Give to")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(.black)
                            Image(ineagiUser.strumAvatar)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color(red: 234/255, green: 66/255, blue: 190/255), lineWidth: 2)
                                )
                            Text(ineagiUser.aidrivenName)
                                                    .font(.system(size: 14, weight: .medium))
                                                    .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                backlineShow = false
                                           }) {
                                               Image("gritr_close")
                                                               .resizable()
                                                               .frame(width: 30, height: 30)
                                                   .frame(width: 48, height: 48)
                                                   
                                           }
                                           .background(
                                            Color.white
                                           )
                                           .clipShape(Circle())
                        }.padding(.horizontal,16)
                        HStack{
                            Text("Popularity +\(alderHot)")
                                                    .font(.system(size: 12, weight: .black))
                                                    .foregroundColor(Color(red: 234/255, green: 66/255, blue: 190/255))
                            Spacer()
                        }.padding(.horizontal,16)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(factoryGifts,id: \.id){item in
                                    ZStack {
                                        VStack{
                                            Image(item.laminateImg)
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                            HStack{
                                                Image("gritr_zuan")
                                                    .resizable()
                                                    .frame(width: 18, height: 18)
                                                Text("\(item.lacquerGood)")
                                                                        .font(.system(size: 10, weight: .bold))
                                                                        .foregroundColor(.black)
                                                
                                            }
                                        }
                                    }
                                    .frame(width: 78, height: 92)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .stroke(
                                                Color(red: 234/255, green: 66/255, blue: 190/255),
                                                lineWidth: pruceSelect == item.lacquerGood ? 2 : 0
                                            )
                                    ).padding(.vertical,2)
                                        .onTapGesture {
                                            pruceSelect = item.lacquerGood
                                            alderHot = item.solidwoodPop
                                        }
                                }
                            }.padding(.horizontal,16)
                        }
                        
                        Button(action: {
                            withAnimation{
                                etalslideShowFu = true
                            }
                            
                            
                            
                            
                            
                                       }) {
                                           Text("Give")
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
                                       .padding(.horizontal,16)
                                       .padding(.bottom,25)
                        
                        
                    }.padding(.top,19)
                        
                    
                }
            }
            
            if etalslideShowFu {
                if let countryGift = factoryGifts.first(where: {
                    $0.lacquerGood == pruceSelect
                }) {
                    ArpeggioFu(cedarhGift: countryGift, iopunknName: ineagiUser.aidrivenName, hearsalShow: $etalslideShowFu, onEdrill: {
                        onEdrill(countryGift)
                    })
                        .transition(.opacity)
                }
            }
          
        }
    }
}
