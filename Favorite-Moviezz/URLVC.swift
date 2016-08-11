

import UIKit
import WebKit

class URLVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var webview: WKWebView!
    
    var urlString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "IMDB Page"
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        webview = WKWebView()
        container.addSubview(webview)
        let frame = CGRectMake(0, 64.0, container.bounds.width, container.bounds.height)
        webview.frame = frame
        
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        webview.loadRequest(request)
    }
    
}
