//
//  ViewController.swift
//  Syncthing
//
//  Created by Leonard Chioveanu on 24/10/2015.
//  Copyright © 2015 Leo Chioveanu. All rights reserved.
//

import UIKit
import Syncthing

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            Syncthing.GoSyncthingRun()
        }	
        
        UIApplication.sharedApplication().idleTimerDisabled = true;
    }
}

