//
//  LoginController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 08.08.2021.
//

import UIKit
import WebKit

class MyViewController: UIViewController {

    private let network = NetworkLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        network.forecast()
        network.forecastGroup()

        }
    }


class LoginController: UIViewController{

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [URLQueryItem(name: "client_id", value: "7923218"),
                                 URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                 URLQueryItem(name: "display", value: "mobile"),
                                 URLQueryItem(name: "scope", value: "262150"),
                                 URLQueryItem(name: "response_type", value: "token"),
                                 URLQueryItem(name: "v", value: "5.131")]
        let url = components.url!
        let request = URLRequest(url: url)
        webView.load(request)

    }



}

extension LoginController : WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard navigationResponse.response.url?.path == "/blank.html",
              let fragment = navigationResponse.response.url?.fragment else {
            decisionHandler(.allow)
            return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }

       Session.shared.token = params["access_token"] ?? ""
       Session.shared.userId = params["user_id"] ?? ""

        print("Token: " + Session.shared.token)
        print("User Id: " + Session.shared.userId)

       let vc = MyViewController()
        vc.viewDidLoad()
        decisionHandler(.cancel)
    }

}
