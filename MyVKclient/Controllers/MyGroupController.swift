//
//  MyGroupController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 28.06.2021.
//

import UIKit

class MyGroupController: UITableViewController {

    var myGroup = [groupFriends]()
    let reuseIdentifareCellGroup = "reuseIdentifareCellGroup"
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifareCellGroup)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addNewGroup(_:)), name: NSNotification.Name(rawValue: "sendGroup"), object: nil)
    }
    
    func isConteinInArray (group : groupFriends) -> Bool {
        
        if myGroup.contains(where: { itemGroup in itemGroup.titleGroup == group.titleGroup}) {
            return true
        }
        
        return false
    }

    @objc func addNewGroup (_ notification : Notification) {
        guard let newGroup = notification.object as? groupFriends else {return}
        
        if isConteinInArray(group: newGroup) {
            return
        }
        
        myGroup.append(newGroup)
        self.tableView.reloadData()
  
    }

   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    myGroup.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifareCellGroup, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configureCell(group: myGroup[indexPath.row])
        cell.animateAvatar()

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
 
}
