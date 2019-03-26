//
//  ViewController.swift
//  FirsWeek
//
//  Created by Can Bas on 10/16/18.
//  Copyright © 2018 Can Bas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var viewCells = [String]()
    
    @IBAction func deleteButton(_ sender: UIButton) {
        viewCells.removeAll()
        tableView.reloadData()
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "cell")
        userDefault.synchronize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       //print(vi)
        if let string2 = UserDefaults.standard.array(forKey: "cell") {
            
            viewCells = string2 as! [String]
                        
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell()
            let cellString = viewCells[indexPath.row]
            cell.textLabel?.text = cellString
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewCells.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            viewCells.remove(at: indexPath.row)
            tableView.reloadData()
            let userDefault = UserDefaults.standard
            var myarray = userDefault.array(forKey: "cell")
            myarray?.remove(at: indexPath.row)            
            userDefault.set(myarray, forKey: "cell")
        }
    }
    
}

