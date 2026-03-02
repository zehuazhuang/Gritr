import Foundation
import StoreKit
import Combine
import FacebookCore

/// 内购管理类（StoreKit 1）
@MainActor
class LechordreCoin: NSObject, ObservableObject, SKPaymentTransactionObserver {

    static let shared = LechordreCoin() // 单例
    
    @Published var cordingNum: Int = 0
    @Published var curacyProdu: [SKProduct] = []
    @Published var tonationStatus: String = ""

    private var productIDs: Set<String> = []
    private var productsRequest: SKProductsRequest?

    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }


    func setup(productIDs: Set<String>) {
        self.productIDs = productIDs
        fetchProducts()
    }

 
    private func fetchProducts() {
        CriptionManager.shared.bdivisionShow()
        let request = SKProductsRequest(productIdentifiers: productIDs)
        request.delegate = self
        productsRequest = request
        request.start()
    }

   
    func ingheigPur(productID: String) async {
        CriptionManager.shared.bdivisionShow()
        guard let product = curacyProdu.first(where: { $0.productIdentifier == productID }) else {
            tonationStatus = "Product not found."
            ToastManager.shared.show(tonationStatus)
            CriptionManager.shared.liefactionHide()
            fetchProducts()
            return
        }
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    // MARK: - SKPaymentTransactionObserver
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                handleTransaction(transaction)
            case .failed:
                if let error = transaction.error as? SKError {
                        if error.code == .paymentCancelled {
                           
                            tonationStatus = "Cancel"
                            ToastManager.shared.show(tonationStatus)
                            
                        } else {
                            tonationStatus = error.localizedDescription
                            ToastManager.shared.show(tonationStatus)
                        }
                    }
                    
                    CriptionManager.shared.liefactionHide()
                    SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                handleTransaction(transaction)
            default:
                break
            }
        }
    }

    private func handleTransaction(_ transaction: SKPaymentTransaction) {
        Task { @MainActor in
            let purchaseID = transaction.transactionIdentifier ?? ""
            let serverVerificationData: String
            if let receiptURL = Bundle.main.appStoreReceiptURL,
               let receiptData = try? Data(contentsOf: receiptURL) {
                serverVerificationData = receiptData.base64EncodedString()
            } else {
                serverVerificationData = ""
            }

            if SustainStorge.shared.glissadmov != "" {
                do {
                    let result = try await dsheartgardeneed(purchaseID: purchaseID, jazmovezStr: serverVerificationData)
                  
                    if !result {
                        CriptionManager.shared.liefactionHide()
                        SKPaymentQueue.default().finishTransaction(transaction)
                        return
                    }
                } catch {
                   
                    CriptionManager.shared.liefactionHide()
                    SKPaymentQueue.default().finishTransaction(transaction)
                    return
                }
            } else {
                SustainStorge.shared.updaNaturalUser(by: SustainStorge.shared.reverbUsers[SustainStorge.shared.epickingLIndex].hykingUserId) { user in
                    user.noisegateGood += cordingNum
                }
            }

            SKPaymentQueue.default().finishTransaction(transaction)

           
            tonationStatus = "success!"
            CriptionManager.shared.liefactionHide()
            ToastManager.shared.show(tonationStatus)
        }
    }

    // MARK: - 服务器验证
    func dsheartgardeneed(
        purchaseID: String,
        jazmovezStr: String
    ) async throws -> Bool {
        let body: [String: Any] = [
            "9e8db679e70ac7e82d1fb3d8b859f14b".tibravoclo(): SustainStorge.shared.pframoop
        ]
        let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
        let jsonStr = String(data: jsonData, encoding: .utf8)!
        let data = await Motifpatternjk().posattitudee("1b67ad94f99a1a1004a716d330164510625dc6a20679c92da9bb9311a732041d".tibravoclo(), await Motifpatternjk.tabrlinwaterpro(lashcuofg: purchaseID, glulashe: jazmovezStr, tinshapingt: jsonStr))
        if let json = data, let code = json["2ed5e56f5f69c185a55161b5416fbf25".tibravoclo()] as? String, code == "950c724015f6243f486e2b9c105ff1e0".tibravoclo() {
            
            var currentLatency: Double {
                SustainStorge.shared.cmixingkCoins.first {
                    $0.id == SustainStorge.shared.pframoop
                }?.latencyDoub ?? 0
            }
          
            AppEvents.shared.logPurchase(
                amount: currentLatency,
                currency: "6b7e44975cf7a8e3a32708568b373bcc".tibravoclo(),
                parameters: [
                    AppEvents.ParameterName("85af06745c5f298c10d0b1e1db38d0c262d21c06dd4fdb88eaa9b746eb5ea24e".tibravoclo()): "b4a154d6665716d5df6f60e9dc289751".tibravoclo()
                ]
            )
            
            return true
        }
        return false
    }
}

// MARK: - SKProductsRequestDelegate
extension LechordreCoin: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.curacyProdu = response.products
            CriptionManager.shared.liefactionHide()
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            CriptionManager.shared.liefactionHide()
            self.tonationStatus = "Products request failed: \(error.localizedDescription)"
            ToastManager.shared.show(self.tonationStatus)
        }
    }
}
