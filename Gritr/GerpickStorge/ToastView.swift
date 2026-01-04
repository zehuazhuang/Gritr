import SwiftUI

struct ToastView: View {
    @ObservedObject var toast = ToastManager.shared

    var body: some View {
        ZStack {
            if toast.isShowing {
                    Text(toast.message)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.85))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.bottom, 60)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .allowsHitTesting(false)
        .animation(.easeInOut(duration: 0.25), value: toast.isShowing)
    }
}
