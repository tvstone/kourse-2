
import UIKit

class AllGroupViewController: UITableViewController {

    var allGroup = [groupFriends]()
    let reuseIdentifareCellGroup = "reuseIdentifareCellGroup"

    func  setupGroup() -> [groupFriends] {
        var itogArray = [groupFriends]()
        
        let firstGroup = groupFriends(titleGroup: "Близкие друзья", avaGroup: UIImage(named: "1_3")!, variableDescriptionGroup: "Одноклассники")
        itogArray.append(firstGroup)
        
        let secondGroup = groupFriends(titleGroup: "Товарищи", avaGroup: UIImage(named: "1_4")!, variableDescriptionGroup: "Одноклассники")
        itogArray.append(secondGroup)
        
        return itogArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allGroup = setupGroup()
        self.tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifareCellGroup)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifareCellGroup, for: indexPath) as? UniversalTableViewCell else {return UITableViewCell()}

        cell.configureCell(group: allGroup[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableViewCell,
              let cellObject = cell.saveObject as? groupFriends
              else {return}
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sendGroup"), object: cellObject)
        
        self.navigationController?.popViewController(animated: true)
    }

}
