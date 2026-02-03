
import SwiftUI
import SwiftfulRouting

class AppPaplocke: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

@main
struct GritrApp: App {
    @UIApplicationDelegateAdaptor(AppPaplocke.self) var appPaplocke
    @StateObject private var store = SustainStorge.shared

    var body: some Scene {
        WindowGroup {
            ZStack {
                RouterView { router in
                    Group {
                        if store.epickingLIndex != -1 {
                            SemihollowHome()
                        } else {
                            HeadstockInit()
                        }
                    }
                    .environment(\.router, router)
                }

                
                ToastView()
            }
        }
    }
}

