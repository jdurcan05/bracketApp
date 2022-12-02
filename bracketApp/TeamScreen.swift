//
//  teamScreen.swift
//  bracketApp
//
//  Created by JAMES DURCAN on 12/2/22.
//

import UIKit

class TeamScreen: UIViewController {

    @IBOutlet weak var textfieldOutlet: UITextField!
    
    var teams: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButtonAction(_ sender: Any)
    {
        if textfieldOutlet.text != nil
        {
            teams.append(textfieldOutlet.text!)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Enter a team name!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
    }
    
    @IBAction func randomizeAction(_ sender: Any) {
    }
    
}
