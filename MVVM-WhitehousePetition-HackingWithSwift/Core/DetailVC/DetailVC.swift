//
//  DetailVC.swift
//  WhitehousePetitions-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 11.08.2023.
//

import UIKit
import WebKit

final class DetailVC: UIViewController {
    
    var webView: WKWebView!
    var detailItem: PetitionResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        setWebView()
    }
}

extension DetailVC  {
    
    func setWebView() {
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name ="viewport" content="width=device-width, initial-scale=1">
        <style> body { front-size: %150"; } </style>
        </head>
        <body>
        \(detailItem.body ?? "")
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
}
