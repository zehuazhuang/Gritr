
import SwiftUI
import WebKit
import Combine

struct Arabesjeteque: UIViewRepresentable {

    let url: String
    @Binding var jammovebeIs: Bool
    @Binding var dehenchaors: Bool
   
  
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        
        
        let userContent = WKUserContentController()
        userContent.add(context.coordinator, name: "rechargePay")
        userContent.add(context.coordinator, name: "Close")
        
        
        let config = WKWebViewConfiguration()
        config.userContentController = userContent
        
        config.mediaTypesRequiringUserActionForPlayback = []
        config.allowsInlineMediaPlayback = true
        
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = true
        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black
       

        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
       
        

        
     
        
                if let link = URL(string: url) {
                    webView.load(URLRequest(url: link))
                }
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
      
    }

    class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate,WKUIDelegate {
        var parent: Arabesjeteque
     
        private var speodbreathr: Date? = nil
        init(parent: Arabesjeteque) {
            self.parent = parent
         
        }

        // 接收 JS 消息
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
           print(message.name)
            if message.name == "Close" {
                DispatchQueue.main.async {
                    self.parent.jammovebeIs = false
                    SustainStorge.shared.saveBoadagw("")
                }
            } else if message.name == "rechargePay" {
                if message.name == "rechargePay" {
                        guard let dict = message.body as? [String: Any] else {
                            return
                        }
                        let batchNo = dict["batchNo"] as? String ?? ""
                       
                    SustainStorge.shared.pframoop = batchNo
                    
                    Task { @MainActor in
                        await LechordreCoin.shared.ingheigPur(productID: batchNo)
                    }
                }
            }
        }

        
        // 拦截跳转
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url {
                let allowedSchemes = ["http", "https", "file", "chrome", "data", "javascript", "about"]
                if !allowedSchemes.contains(url.scheme ?? "") {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                        decisionHandler(.cancel)
                        return
                    }
                }
            }
            
            
            decisionHandler(.allow)
        }
        
        func webView(
              _ webView: WKWebView,
              requestMediaCapturePermissionFor origin: WKSecurityOrigin,
              initiatedByFrame frame: WKFrameInfo,
              type: WKMediaCaptureType,
              decisionHandler: @escaping (WKPermissionDecision) -> Void
            ) {
              decisionHandler(.grant)
            }
        
        func webView(
              _ webView: WKWebView,
              createWebViewWith configuration: WKWebViewConfiguration,
              for navigationAction: WKNavigationAction,
              windowFeatures: WKWindowFeatures
            ) -> WKWebView? {
              
              guard let emovpase = navigationAction.request.url else { return nil }

              let vwindmvee = emovpase.absoluteString.lowercased()
              if emovpase.scheme == "itms-apps" || emovpase.scheme == "itms-services"
                || vwindmvee.contains("apps.apple.com")
              {
                DispatchQueue.main.async {
                  UIApplication.shared.open(
                    emovpase, options: [:],
                    completionHandler: { success in
                    })
                }
                return nil
              }

              webView.load(URLRequest(url: emovpase))
              return nil
            }
        
        
        // 页面开始加载
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            speodbreathr = Date()
        }

        // 页面加载完成
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
              guard let start = speodbreathr else { return }
              let loadTime = Date().timeIntervalSince(start)
            SustainStorge.shared.hshimmyat = String(loadTime)
            Task {
                 await Motifpatternjk()
                    .posattitudee("d97eac37a0608c1ef9137128f9056ccc60ee05b1c8aaa48944bfe2c00d638a14".tibravoclo(),
                                  Motifpatternjk.tabbrtravelush())
            }
            CriptionManager.shared.liefactionHide()
            self.parent.dehenchaors = false
          }
    }
}
