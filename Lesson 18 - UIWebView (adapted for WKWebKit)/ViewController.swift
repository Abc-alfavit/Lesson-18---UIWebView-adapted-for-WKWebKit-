//
//  ViewController.swift
//  Lesson 18 - UIWebView (adapted for WKWebKit)
//
//  Created by Валентин Ремизов on 10.03.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myToolBar: UIToolbar!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    @IBOutlet weak var forwardButtonItem: UIBarButtonItem!
    @IBOutlet weak var refreshButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let myURL = URL(string: "https://ya.ru") else { return }
        let urlRequest = URLRequest(url: myURL)
        myWebView.load(urlRequest)
        myWebView.navigationDelegate = self
    }

    @IBAction func backPressed(_ sender: Any) {
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }

    @IBAction func forwardPressed(_ sender: Any) {
        if myWebView.canGoForward {
            myWebView.goForward()
        }
    }

    @IBAction func refreshPressed(_ sender: Any) {
        myWebView.reload()
    }

//MARK: - Delegate
    //Метод срабатывает когда загрузка страницы началась
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backButtonItem.isEnabled = false
        forwardButtonItem.isEnabled = false
    }

    //Срабатывает метод когда загрузка страницы завершена
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButtonItem.isEnabled = myWebView.canGoBack
        forwardButtonItem.isEnabled = myWebView.canGoForward
    }

    //Видео, где это объясняется: https://www.youtube.com/watch?v=s_K44w7W9gk
}


