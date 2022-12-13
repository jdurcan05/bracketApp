
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
        tableViewOutlet.dragInteractionEnabled = true
        tableViewOutlet.isEditing = true
        tableViewOutlet.allowsSelectionDuringEditing = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel!.text = AppData.teams[indexPath.row]
        cell.detailTextLabel!.text = "Seed: \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            AppData.teams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableViewOutlet.reloadData()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        AppData.teams.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
        @IBAction func plusButtonAction(_ sender: Any)
        {
            if textfieldOutlet.text != ""
            {
                AppData.teams.append(textfieldOutlet.text!)
                tableViewOutlet.reloadData()
                textfieldOutlet.text = ""
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "Enter a team name!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            
            
        }
        
  
    
    @IBAction func confirmButtonAction(_ sender: Any)
    {
       performSegue(withIdentifier: "unwindSegue", sender: nil)
            
    }
        
    @IBAction func randomButtonAction(_ sender: UIButton) {
        AppData.teams.shuffle()
        tableViewOutlet.reloadData()
    }
    
    }
