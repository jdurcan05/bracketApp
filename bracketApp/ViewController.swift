//
//  ViewController.swift
//  bracketApp
//
//  Created by JAMES DURCAN on 12/1/22.
//

import UIKit

class AppData{
    static var teams: [String] = []
    static var numberOfTeams = 0
    
}

class ViewController: UIViewController {

    var test = "test"
    var kanye = "Not cool dude"
    var jame = "Sucks"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    
@IBAction func addParticipentSegueButton(_ sender: Any) {
    print("working")
    }
    
    func makeBracket(teams: [String]){
        
    }
}

