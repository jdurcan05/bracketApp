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
    static var matches: [MatchupClass] = []
    static var teamCheck = false
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool){
        if AppData.teams.count !=  0{
            makeBracket(teams: AppData.teams)
        }
        tableViewOutlet.reloadData()
    }

    
    var test = "test"
    var kanye = "Not cool dude"
    var mase = "lame"
    var rounds = 0
    var labels = ["Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Nineth", "Tenth", "Eleventh", "Twelfth", "Thirteenth", "Fourteenth", "Fifteenth"]
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var addParticipentsOutlet: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Hello")
        return AppData.matches.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! VsCell
        cell.configure(match: AppData.matches[indexPath.row])
        print("CELL MADE")
            return cell
    }
    

 
   

    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    
@IBAction func addParticipentSegueButton(_ sender: Any) {
        }
    
    //table time
    
    
    
    
    
    
    
    //Making this do the whole bracket (Trying). The number is the amount of people who move on to round 2 without having to play anyone. Should be correct.
    func makeBracket(teams: [String]){
        //checks if a bracket is a power of 2 or even
        var tempTeams = teams
        var check = false
        var bies = 0
        var perfect = false
        var count = teams.count
        var firstRoundMatches: Int
        rounds = 0
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
       
        firstRoundMatches = firstRoundMatchesCalc(perfect: perfect, teams: teams, bies: bies)
        var newCount = firstRoundMatches
        newCount = (firstRoundMatches + bies)/2
        rounds = 2
        while(newCount != 1){
            newCount = newCount/2
            rounds += 1
        }
        addSegueButtons(rounds2: rounds)
        //this if else covers first round matches and places them into the table, we need to find a way to show a seperate table for seperate matches
        if(perfect){
            var teamsTemp = teams
            for _ in 0..<firstRoundMatches {
                AppData.matches.append(MatchupClass.init(hTeam:tempTeams[0], aTeam: tempTeams[1], hScore: 0, aScore: 0, match: true))
                print(teamsTemp)
                tempTeams.remove(at: 0)
                tempTeams.remove(at:0)
                print(AppData.matches[0].homeTeam)
            }
            tableViewOutlet.reloadData()
            //make table just print one array[0] and array [1] into each seperate spot and then delete them from the temporary array this is only minimum and first round only populate table with first round matches cells only
        }
        else{
            var teamsTemp = teams
            for _ in 0..<firstRoundMatches {
                AppData.matches.append(MatchupClass.init(hTeam:tempTeams[0], aTeam: tempTeams[1], hScore: 0, aScore: 0, match: true))
                print(teamsTemp)
                tempTeams.remove(at: 0)
                tempTeams.remove(at:0)
                print(AppData.matches[0].homeTeam)
            }
            for _ in 0..<bies
            {
                AppData.matches.append(MatchupClass.init(hTeam: tempTeams[0], aTeam: "BYE", hScore: 0, aScore: 0, match: false))
                tempTeams.remove(at: 0)
            }
            
            tableViewOutlet.reloadData()
           // populate table with only the amount of cells as first round matches and only run the loop to put people in that many times
        }
        print("test")
    }
    
    
    
    
    //calclulates first roundMatches
    func firstRoundMatchesCalc(perfect: Bool, teams: [String], bies: Int)-> Int{
        var firstRoundMatches = 0
        if(perfect){
            firstRoundMatches = teams.count/2
        }
        else{
            firstRoundMatches = (teams.count+bies)/2 - bies
        }
        return firstRoundMatches
    }
    
    func addSegueButtons(rounds2: Int){
        if(rounds2 > 2){
            for i in 0 ... rounds2-3 {
                segmentedOutlet.insertSegment(withTitle: labels[i], at: i+2, animated: false)
            }
        }
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue)
    {
        print("unwind")
        addParticipentsOutlet.isHidden = true
        if AppData.teams.count !=  0{
            makeBracket(teams: AppData.teams)
        }
        tableViewOutlet.reloadData()
        segmentedOutlet.isHidden = false
        
    }

    
}

