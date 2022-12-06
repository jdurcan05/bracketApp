//
//  teamScreen.swift
//  bracketApp
//
//  Created by JAMES DURCAN on 12/2/22.
//

import UIKit

class TeamScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textfieldOutlet: UITextField!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel!.text = AppData.teams[indexPath.row]
        return cell
    }
        
        
        
        @IBAction func plusButtonAction(_ sender: Any)
        {
            if textfieldOutlet.text != nil
            {
                AppData.teams.append(textfieldOutlet.text!)
                tableViewOutlet.reloadData()
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
        
    @IBAction func randomButtonAction(_ sender: UIButton) {
        AppData.teams.shuffle()
        //tableView.reloadData
    }
    
    }
