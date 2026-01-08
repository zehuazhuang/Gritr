import UIKit
import WebKit

class EarmindfltCont: UIViewController, WKNavigationDelegate {

    var puremiView: WKWebView!
    var walancString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let webConfiguration = WKWebViewConfiguration()
        puremiView = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
        puremiView.navigationDelegate = self
        self.view.addSubview(puremiView)

       
        if let walancString = walancString, let url = URL(string: walancString) {
            let nsideReq = URLRequest(url: url)
            puremiView.load(nsideReq)
        }
    }
}


