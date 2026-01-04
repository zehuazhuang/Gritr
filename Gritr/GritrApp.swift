
import SwiftUI
import SwiftfulRouting

@main
struct GritrApp: App {

    @StateObject private var store = SustainStorge.shared

    var body: some Scene {
        WindowGroup {
            ZStack {
                if store.epickingLIndex != -1 {
                    SemihollowHome()
                } else {
                    RouterView { router in
                        HeadstockInit()
                            .environment(\.router, router)
                    }
                }

                ToastView()
            }
        }
    }
}

