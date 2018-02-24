//
//  ViewController.swift
//  Client App
//
//  Created by Prescott, Ste on 24/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import UIKit

extension String {
    var url: URL? {
        return URL(string: self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    let urls = [
        "hostapp:/color", "hostapp:/color?value=pink",
        "hostapp:/message?string=Hello", "hostapp:/message",
        "hostapp:/park/start", "hostapp:/park/stop", "hostapp:/park?start=true", "hostapp:/park?start=false"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        for (i, url) in urls.enumerated() {
            let button = UIButton(type: .system)
            button.tag = i
            button.setTitle(url, for: .normal)
            button.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)

            stackView.addArrangedSubview(button)
        }
    }

    @objc
    func buttonWasTapped(_ sender: UIButton) {
        let url = urls[sender.tag].url!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

