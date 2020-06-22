//
//  UsersVC.swift
//  UserList
//
//  Created by Yaz Burrell on 6/22/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import UIKit

class UsersVC: UITableViewController {

  var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
 
    
    func getUsers(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            if let error = error {
                print(error.localizedDescription)
                
            } else if let data = data {

                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] else
                    { return }
                    print(json)
                    
                    let users = [User]()
                    
                    for userDictionary in json {
                        
                        guard
                            let name = userDictionary["name"] as? String,
                            let address = userDictionary["address"] as? [String : Any],
                            let city = address["city"] as? String
                        else { return }
                  
                        let user = User(name: name, city: city)
                        self.users.append(user)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                    print(users)
                    
                } catch let err{
                    print(err)
                }
            }
        }
        dataTask.resume()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.city
        return cell
    }


}
