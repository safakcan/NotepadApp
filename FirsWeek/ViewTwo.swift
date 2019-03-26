//
//  ViewTwo.swift
//  FirsWeek
//
//  Created by Can Bas on 10/17/18.
//  Copyright © 2018 Can Bas. All rights reserved.
//

import Foundation
import UIKit

class ViewTwo: UIViewController {

    var cellText = "";
    @IBAction func saveButton(_ sender: Any) {
        self.cellText = textField.text!
        performSegue(withIdentifier: "segueName", sender: self)
    }
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let string2 = UserDefaults.standard.array(forKey: "cell") {
            var array = string2
            
            if !self.cellText.isEmpty {
            array.insert(self.cellText, at: 0)
            let userDefaults = UserDefaults.standard
            userDefaults.set(array, forKey: "cell")
            }
        } else {
            var array: [String] = [String]()
            array.append(self.cellText)
            let userDefaults = UserDefaults.standard
            userDefaults.set(array, forKey: "cell")
        }
    }

}
