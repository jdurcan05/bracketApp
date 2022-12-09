//
//  MatchupClass.swift
//  bracketApp
//
//  Created by MASON ROZUMNY on 12/9/22.
//

import Foundation


class MatchupClass{
    var homeTeam: String
    var awayTeam: String
    var homeScore: Int
    var awayScore: Int
    
    
    init(hTeam: String, aTeam: String, hScore: Int, aScore: Int) {
        
        homeTeam = hTeam
        awayTeam = aTeam
        homeScore = hScore
        awayScore = aScore
        
        
    }
    
}
