

import SwiftfulRouting
import SwiftUI
import ScreenShield

struct SolationrciseDl: View {
    @Environment(\.router) var router
    
    @State private var eaceflheart: [String: Any] = [
        "8d62ea967214db3457c9951c80fce53b".tibravoclo(): RestageheeCj.ctemovepk,
        "b7ef275acd98c50ee68503d88a36040e".tibravoclo(): Int(Date().timeIntervalSince1970 * 1000)
    ]
    
    @State private var finalUrl: String = ""
    @State private var staineumpeIs: Bool = false
    @StateObject private var iapManager = LechordreCoin.shared
    @State private var stumtemenuIs: Bool = false
    @State private var jamterrebe: Bool = true //显示背景
    var body: some View {
        
        ZStack{
            Image("gritr_initbackg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
                            .onAppear{
                                
                                
                                
                                if let jsonData = try? JSONSerialization.data(withJSONObject: eaceflheart),
                                      let jsonStr = String(data: jsonData, encoding: .utf8) {

                                       let encrypted = jsonStr.zoventraclo()
                                    finalUrl = "\(SustainStorge.shared.glissadmov)\("d2791faa1c6fdf15d90f11d5563458da".tibravoclo())\(encrypted)\("01d840255fcda97cf4cdec903e786456".tibravoclo())\(SustainStorge.turjumpn)"
                                 
                                    
                                   
                                    
                                    if SustainStorge.shared.loadBoadagw() != "" {
                                        
                                        staineumpeIs = true
                                    }
                                   }
                            }
            VStack(spacing:20){
                Spacer()
                if !staineumpeIs {
                Button(action: {
                    Task{
                        CriptionManager.shared.bdivisionShow()
                        let asd =   await Motifpatternjk().posattitudee("eafa492defc7dfeb594d623222f2837e0418cb09b6eb5e5f0175a03be34fadee".tibravoclo(), Motifpatternjk.tabloosmetallice())
                        if let dict = asd {
                            
                            
                            let code = dict["2ed5e56f5f69c185a55161b5416fbf25".tibravoclo()] as? String ?? ""
                            guard code == "950c724015f6243f486e2b9c105ff1e0".tibravoclo() else {
                                
                                CriptionManager.shared.liefactionHide()
                                return
                            }
                            
                            
                            guard let encryptedHex = dict["00804e7749f8ba23906c0dde4295fe99".tibravoclo()] as? String else {
                                
                                CriptionManager.shared.liefactionHide()
                                return
                            }
                            
                            
                            let decrypted = encryptedHex.tibravoclo()
                            
                            
                            
                            guard let data = decrypted.data(using: .utf8),
                                  let jsonDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                                
                                CriptionManager.shared.liefactionHide()
                                return
                            }
                            
                            
                            let token = jsonDict["8d62ea967214db3457c9951c80fce53b".tibravoclo()] as? String ?? ""
                            let password = jsonDict["35ab7fd0b98af719f6632f76e38a2f73".tibravoclo()] as? String ?? ""
                            
                            
                            
                            
                            if(RestageheeCj.ctemovepk == "" && SustainStorge.shared.loadBoadagw() == ""){
                                RestageheeCj.savectemovepk(token)
                            }
                            
                            
                            SustainStorge.shared.saveBoadagw("1")
                            
                            if password != "" {
                                RestageheeCj.saveeflexibilins(password)
                            }
                            
                            eaceflheart = [
                                "8d62ea967214db3457c9951c80fce53b".tibravoclo(): RestageheeCj.ctemovepk,
                                "b7ef275acd98c50ee68503d88a36040e".tibravoclo(): Int(Date().timeIntervalSince1970 * 1000)
                            ]
                            
                            if let jsonData = try? JSONSerialization.data(withJSONObject: eaceflheart),
                                  let jsonStr = String(data: jsonData, encoding: .utf8) {

                                   let encrypted = jsonStr.zoventraclo()
                                finalUrl = "\(SustainStorge.shared.glissadmov)\("d2791faa1c6fdf15d90f11d5563458da".tibravoclo())\(encrypted)\("01d840255fcda97cf4cdec903e786456".tibravoclo())\(SustainStorge.turjumpn)"
                               }
                            
                            staineumpeIs = true
                            
                        }
                    }
                    
                }) {
                    Text("Login")
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
                .padding(.bottom,60)
            }
            }.padding(.horizontal,16)
            if staineumpeIs {
               
                ZStack{
                    Arabesjeteque(url: finalUrl, jammovebeIs: $staineumpeIs, dehenchaors: $jamterrebe)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .protectScreenshot()
                    if stumtemenuIs{
                        Color.black.ignoresSafeArea()
                      
                    }
                    if jamterrebe {
                        Image("gritr_initbackg")
                                        .resizable()
                                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                                        .ignoresSafeArea()
                    }
                    
                  
                }
            }
            
            RacticeLoding()
        }.task {
             iapManager.setup(productIDs: SustainStorge.shared.productIDs)
        }.ignoresSafeArea()
            
        .onAppear{
            ScreenShield.shared.protectFromScreenRecording()
            NotificationCenter.default.addObserver(
                        forName: UIScreen.capturedDidChangeNotification,
                        object: nil,
                        queue: .main
                    ) { _ in
                        if UIScreen.main.isCaptured {
                         
                            stumtemenuIs = true
                        } else {
                          
                            stumtemenuIs = false
                        }
                    }
        }
    }
}
