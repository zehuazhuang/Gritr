import SwiftUI
import SwiftfulRouting

struct DeondeReportOverlay: View {
    @Binding var isRumchaba: Bool
    let piroueUserId: Int
    @Environment(\.router) var router
    let onUpdnter : () -> Void

    var body: some View {
        if isRumchaba {
            DexterityReport(hearwUserId: piroueUserId, gensootShow: $isRumchaba) {
               
                    router.showScreen(.fullScreenCover) { _ in
                        ToastHost {
                        OctaverRDateils()
                    }
                }
            } onBlock: {
                onUpdnter()
            }
            .transition(.opacity)
        }
    }
}

extension View {
    func deondeReportOverlay(isRumchaba: Binding<Bool>, piroueUserId: Int,onUpdnter: @escaping () -> Void) -> some View {
        ZStack {
            self
            DeondeReportOverlay(isRumchaba: isRumchaba, piroueUserId: piroueUserId, onUpdnter: onUpdnter)
        }
    }
}
