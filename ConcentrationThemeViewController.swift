//
//  ConcentrationThemeViewController.swift
//  Concentration
//
//  Created by BHAVANASINGH on 28/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = [
        "Animals":"🐶🐣🐼🐙🦋🐳🐯🦁",
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏓🏑",
        "Halloween":"🦇😱🙀😈🎃👻💀🧛‍♂️",]
    
    // MARK: - Navigation
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    //Function for iphone home screen THEME display.
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        //Fuction asking : did you do it?
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    
    
    
    @IBAction func chooseTheme(_ sender: Any) {
        if let cvc = splitViewDetailViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
              cvc.theme = theme
                }
        }else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc,animated: true)
        }else {
       performSegue(withIdentifier: "Choose Theme" , sender: sender)
    }
        
    }
    private var splitViewDetailViewController : ConcentrationViewController?{
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                    if let cvc = segue.destination as? ConcentrationViewController {
                        cvc.theme = theme
                        lastSeguedToConcentrationViewController = cvc
                    }
                }
        }
        
    }

}
