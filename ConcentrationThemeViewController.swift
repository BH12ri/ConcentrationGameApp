//
//  ConcentrationThemeViewController.swift
//  Concentration
//
//  Created by BHAVANASINGH on 28/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {

    let themes = [
        "Animals":"🐶🐣🐼🐙🦋🐳🐯🦁",
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏓🏑",
        "Halloween":"🦇😱🙀😈🎃👻💀🧛‍♂️",]
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                    if let cvc = segue.destination as? ConcentrationViewController {
                        cvc.theme = theme
                    }
                }
        }
        
    }

}
