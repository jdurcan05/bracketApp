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
    var mason = "Sucks"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    
@IBAction func addParticipentSegueButton(_ sender: Any) {
    print("working")
    print( makeBracket(teams: AppData.teams))
    }
    
    
    
    
    //This literally just fetches the amount of bies. The number is the amount of people who move on to round 2 without having to play anyone. Should be correct.
    func makeBracket(teams: [String]) -> Int{
        //checks if a bracket is a power of 2 or even
        var check = false
        var bies = 0
        var perfect = false
        var count = teams.count
        if (count%2 == 0){
            while (count%2 == 0 ){
                count = count/2
            }
            if (count == 1){
                perfect = true
                count = teams.count
                print("Perfect")
            }
            else{
                perfect = false
                count = teams.count
            }
        }
        if(!perfect){
            while(!check){
                count+=1
                bies+=1
                if (count%2 == 0){
                    var temp = count
                    while (temp%2 == 0 ){
                        temp = temp/2
                    }
                    if (temp == 1){
                       check = true
                    }
                }
            }
        }
        return bies
    }
}

