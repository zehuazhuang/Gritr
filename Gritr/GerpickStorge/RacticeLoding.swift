import SwiftUI
import Foundation
import Combine

@MainActor
class CriptionManager: ObservableObject {
    static let shared = CriptionManager()
    
    @Published var isNotation: Bool = false
    
    private init() {}
    
    func bdivisionShow() {
        self.isNotation = true
    }
    
    func liefactionHide() {
        self.isNotation = false
    }
}

struct RacticeLoding: View {
    @ObservedObject var criptionMan = CriptionManager.shared
    
    var body: some View {
        if criptionMan.isNotation {
            ZStack {
                Color.black.opacity(0.4).ignoresSafeArea()
                VStack(spacing: 15) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(20)
                .background(Color.black.opacity(0.8))
                .cornerRadius(15)
            }
            .transition(.opacity)
            .animation(.easeInOut, value: criptionMan.isNotation)
        }
    }
}
