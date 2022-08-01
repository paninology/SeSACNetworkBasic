//
//  WebViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/28.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    // "WebViewController"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
   
    var destinationURL: String = "https://www.apple.com" // App Transport Security Settings
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        openWebPage(url: destinationURL)
    }
    
    func openWebPage(url: String) {
        guard let url = URL(string: url) else {
            print("invalid URL")
            return
        }
        let requst = URLRequest(url: url)
        webView.load(requst)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func goBackButtonClicked(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    @IBAction func refeshButtonClicked(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goFowardButtonClicked(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
}

extension WebViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}
