//
//  AppDelegate.swift
//  Host App
//
//  Created by Prescott, Ste on 23/02/2018.
//  Copyright © 2018 Demo App. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return open(url, with: options)
    }

    @discardableResult
    func open(_ url: URL, with options: [UIApplicationOpenURLOptionsKey : Any] = [:], approved isApproved: Bool = false) -> Bool {
        do { return try URLHandler.handel(url, with: options, approved: isApproved) }
        catch let e as URLHandler.Error {
            URLHandler.log(e.description)

            switch e {
            case .unknownSource:

                let unauthorisedAlert = alert

                let yes = UIAlertAction(title: "Yes", style: .default, handler: { [unowned self] _ in
                    URLHandler.log("Approved deep link from an unauthorised source")
                    self.open(url, with: options, approved: true)
                })

                unauthorisedAlert.addAction(yes)

                window?.rootViewController?.show(unauthorisedAlert, sender: nil)
                
            default: break
            }

            return false
        }
        catch { return false }
    }

    var alert: UIAlertController {
        let alert = UIAlertController(title: "Unauthorised",
                                      message: "Deep link came from an unknown source. Do you want to open it anyway?",
                                      preferredStyle: .alert)
        alert.addAction(no)

        return alert
    }

    lazy var no = UIAlertAction(title: "No", style: .cancel, handler: { _ in
        URLHandler.log("Rejected deep link from an unauthorised source")
    })
}
