//
//  ViewController.swift
//  WhatsNewOnboarding
//
//  Created by James Rochabrun on 12/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        whatsNewIfNeeded()
    }

    private func whatsNewIfNeeded() {
        
        let theme = WhatsNewViewController.Theme  { config in
            config.apply(animation: .fade)
            config.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0, blue: 0.6274509804, alpha: 1)
            config.titleView.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            config.itemsView.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            config.itemsView.subtitleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            config.completionButton.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.9879381334, blue: 0.6274509804, alpha: 1)
        }
        
        let config = WhatsNewViewController.Configuration(theme: theme)
        let whatsNew = WhatsNew(title: "Yahoo Mail App", items: Features.items)
        
        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: UserDefaults.standard)
        guard let whatsNewVC = WhatsNewViewController(whatsNew: whatsNew, configuration: config, versionStore: keyValueVersionStore) else { return }
        
        self.present(whatsNewVC, animated: true)
    }
}


struct Features {
    
    static let items: [WhatsNew.Item] = [
        WhatsNew.Item(title: "Siri Shortcuts", subtitle: "Customize Siri", image: #imageLiteral(resourceName: "themes")),
        WhatsNew.Item(title: "Weather Widget", subtitle: "Check the weather on your mail!", image: #imageLiteral(resourceName: "setup")),
        WhatsNew.Item(title: "Earny", subtitle: "Custom", image: #imageLiteral(resourceName: "installation")),
        WhatsNew.Item(title: "Siri Shortcuts", subtitle: "Customize Siri", image: #imageLiteral(resourceName: "openSource"))

    ]
}
