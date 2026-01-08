

import SwiftUI
import SwiftfulRouting

struct HeartwContrVi: UIViewControllerRepresentable {
    let tpondpoStr: String

    func makeUIViewController(context: Context) -> EarmindfltCont {
        let vc = EarmindfltCont()
        vc.walancString = tpondpoStr
        return vc
    }

    func updateUIViewController(_ uiViewController: EarmindfltCont, context: Context) {
        
    }
}

struct AlternatounView: View {
    @Environment(\.router) var router
    let calmwStr : String
    var body: some View {
        ZStack{
            Image("gritr_backg")
                            .resizable()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        router.dismissScreen()
                                    }) {
                                        Image("gritr_back")
                                            .resizable()
                                            .frame(width: 8,height: 16)
                                            .frame(width: 40, height: 40)
                                            
                                    }
                                    .background(
                                        .white.opacity(0.1)
                                    )
                                    .clipShape(Circle())
                    Spacer()
                }.padding(.horizontal,16)
                
                HeartwContrVi(tpondpoStr: calmwStr)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
