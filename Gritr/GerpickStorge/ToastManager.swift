import SwiftUI
import Combine
struct ToastHost<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
            ToastView()
        }
    }
}

final class ToastManager: ObservableObject {
    static let shared = ToastManager()

    @Published var isShowing = false
    @Published var message = ""

    private init() {}

    func show(_ text: String, duration: Double = 1.0) {
        DispatchQueue.main.async {
            self.message = text
            self.isShowing = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.isShowing = false
            }
        }
    }
}

