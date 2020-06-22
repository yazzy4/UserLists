//
//  UsersVC.swift
//  UserList
//
//  Created by Yaz Burrell on 6/22/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import UIKit

class UsersVC: UITableViewController {

    
    let tempUsers = ["Jane", "Silvia", "George", "Dorkus", "Sabrina", "Harvey"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return tempUsers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = tempUsers[indexPath.row]
        cell.textLabel?.text = user
        return cell
    }


}
