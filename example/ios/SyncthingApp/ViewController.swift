//
//  ViewController.swift
//  Syncthing
//
//  Created by Leonard Chioveanu on 24/10/2015.
//  Copyright © 2015 Leo Chioveanu. All rights reserved.
//

import UIKit
import Syncthing

public class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView?
    @IBOutlet weak var backButton: UIBarButtonItem?
    var loadedOnce: Bool?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().idleTimerDisabled = true
        
        Syncthing.GoSyncthingRun()
    }

    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reload()
    }
    
    @IBAction func reload(sender: AnyObject) {
        reload()
    }
    
    @IBAction func back(sender: AnyObject) {
        webView?.goBack()
    }
    
    func reload() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        if let _ = loadedOnce {
            webView?.reload()
        }
        else {
            webView?.loadRequest(NSURLRequest(URL: NSURL(string: "http://127.0.0.1:8384")!))
        }
    }
}

extension ViewController: UIWebViewDelegate {
    
    public func webViewDidFinishLoad(webView: UIWebView) {
        self.loadedOnce = true
        self.title = webView.request?.URL?.absoluteString
        self.backButton?.enabled = webView.canGoBack
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    public func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        guard let _ = loadedOnce else {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.reload()
            }
            
            return;
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}

