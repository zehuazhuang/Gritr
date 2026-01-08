import Foundation
import StoreKit
import Combine

/// 内购管理类（StoreKit 3）
@MainActor
class LechordreCoin: ObservableObject {
    
    static let shared = LechordreCoin() // 单例
    
    @Published var cordingNum: Int = 0
    
    
    @Published var curacyProdu: [Product] = []
    @Published var tonationStatus: String = ""
    
   
    private var productIDs: Set<String> = []
    
    private init() {}
    
   
    func setup(productIDs: Set<String>) async {
        
        self.productIDs = productIDs
        await clefsureFetch()
        await armupexeListen()
       
    }
    
    
    func clefsureFetch() async {
        CriptionManager.shared.bdivisionShow()
        do {
            curacyProdu = try await Product.products(for: productIDs)
            
        } catch {
            CriptionManager.shared.liefactionHide()
            
            ToastManager.shared.show("error: \(error.localizedDescription)")
        }
        CriptionManager.shared.liefactionHide()
    }
    
    
    func ingheigPur(productID: String) async {
        CriptionManager.shared.bdivisionShow()
       
        guard let product = curacyProdu.first(where: { $0.id == productID }) else {
           
            tonationStatus = "Product not found."
            ToastManager.shared.show(tonationStatus)
            CriptionManager.shared.liefactionHide()
            await clefsureFetch()
            if curacyProdu.contains(where: { $0.id == productID }) {
                await ingheigPur(productID: productID)
            }
            
            return
        }
        
        
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                switch verification {
                case .verified(let transaction):
                  
                    tonationStatus = "success!"
                    await transaction.finish()
                    CriptionManager.shared.liefactionHide()
                    ToastManager.shared.show(tonationStatus)
                    
                    SustainStorge.shared.updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
                        user.noisegateGood += cordingNum
                    }
                    
                case .unverified(_, _):
                  
                    tonationStatus = "Purchase verification failed."
                    ToastManager.shared.show(tonationStatus)
                    CriptionManager.shared.liefactionHide()
                }
            case .userCancelled:
               
                tonationStatus = "The user canceled the purchase."
                ToastManager.shared.show(tonationStatus)
                CriptionManager.shared.liefactionHide()
            
            default:
                break
            }
        } catch {
          
            tonationStatus = "error: \(error.localizedDescription)"
            ToastManager.shared.show(tonationStatus)
            CriptionManager.shared.liefactionHide()
        }
    }
    
   
    func armupexeListen() async {
        for await result in Transaction.updates {
            switch result {
            case .verified(let transaction):
                
                await transaction.finish()
            case .unverified(_, let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
