//
//  VsCell.swift
//  bracketApp
//
//  Created by JAMES DURCAN on 12/8/22.
//

import Foundation
import UIKit

class VsCell: UITableViewCell{
    
    @IBOutlet weak var vsLabel: UIStackView!
    
    @IBOutlet weak var teamOneLabel: UILabel!
    
    @IBOutlet weak var teamTwoLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    var cellMatch: MatchupClass?
    func labelChange(teamOne: String, teamTwo: String){
        
    }
    func configure (match: MatchupClass){
        cellMatch = match
        teamOneLabel.text = cellMatch!.homeTeam
        teamTwoLabel.text = cellMatch!.awayTeam    }
}
