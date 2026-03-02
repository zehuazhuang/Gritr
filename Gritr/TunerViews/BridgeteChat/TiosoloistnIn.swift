import SwiftUI
import SwiftfulRouting

struct TiosoloistnIn: View {
    let lectionUser: ReverbUsers
    @Environment(\.router) var router
    @State private var hapticTimer: Timer?
    var body: some View {
        ZStack{
            Image(lectionUser.strumAvatar)
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFill()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            
            VStack(spacing:0){
                Spacer()
                Image(lectionUser.strumAvatar)
                    .resizable()
                .frame(width: 89, height: 89)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                ).padding(.bottom,16)
                Text(lectionUser.aidrivenName)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.bottom,8)
                Text("Calling...")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.bottom,117)
                Image("gritr_bciuwg")
                                .resizable()
                                .frame(width:60,height: 60)
                                .onTapGesture {
                                    router.dismissScreen()
                                }
                                .padding(.bottom,30)
                
                
            }
        }.onAppear {
            startCallHaptic()
        }
        .onDisappear {
            stopCallHaptic()
        }
    }
    
    func startCallHaptic() {
        hapticTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { _ in
            if hapticTimer == nil{
                return
            }
            let exepiecerc = UINotificationFeedbackGenerator()
            exepiecerc.prepare()
            exepiecerc.notificationOccurred(.warning)
        }
    }

    func stopCallHaptic() {
        hapticTimer?.invalidate()
        hapticTimer = nil
    }
}
