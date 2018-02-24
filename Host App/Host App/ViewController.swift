//
//  ViewController.swift
//  Host App
//
//  Created by Prescott, Ste on 23/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceive(notification:)),
                                               name: logNotificationName,
                                               object: nil)
    }

    @objc
    func didReceive(notification: NSNotification) {
        guard let message = notification.userInfo?["message"]
            else { return }

        textView.text.append("\n-- \(message)")
    }
}

