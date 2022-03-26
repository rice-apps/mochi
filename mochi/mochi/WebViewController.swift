//
//  WebViewController.swift
//  mochi
//
//  Created by Angus Jelinek on 3/26/22.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    var url: URL!

    override func loadView() {
        // create and config web view
        let webConfiguration = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        webConfiguration.defaultWebpagePreferences = preferences
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        view = webView

        // register the bridge script that listens for the output
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = url
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    // Add observer
    

    // Observe value
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let key = change?[NSKeyValueChangeKey.newKey] {
            print("observeValue \(key)") // url value
            let url = "\(key)"
            if (url.contains("ticket=")) {
                guard let ticket = getQueryStringParameter(url: "\(key)", param: "ticket") else {return}
                print(ticket)
                login(ticket: ticket)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func getQueryStringParameter(url: String, param: String) -> String? {
      guard let url = URLComponents(string: url) else { return nil }
      return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func login(ticket: String) {
          
          // create the url with URL
            let url = URL(string: "http://www.mochibackend.com/login/\(ticket)")! // change server url accordingly
          
          // create the session object
          let session = URLSession.shared
          
          // now create the URLRequest object using the url object
          var request = URLRequest(url: url)
          request.httpMethod = "POST" //set http method as POST
          
          // add headers for the request
          request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
          request.addValue("application/json", forHTTPHeaderField: "Accept")
          
          // create dataTask using the session object to send data to the server
          let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
              print("Post Request Error: \(error.localizedDescription)")
              return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
              print("nil Data received from the server")
              return
            }
            
            do {
              // create json object from data or use JSONDecoder to convert to Model stuct
              if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                print(jsonResponse)
                // handle json response
              } else {
                print("data maybe corrupted or in wrong format")
                throw URLError(.badServerResponse)
              }
            } catch let error {
              print(error.localizedDescription)
            }
          }
          // perform the task
          task.resume()
    }
}
