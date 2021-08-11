//
//  MyFriendsViewController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 27.06.2021.
//

import UIKit

class MyFriendsViewController: UIViewController {
    

    @IBOutlet weak var FriendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let reuseIdentifireUniversalTableViewCell = "reuseIdentifireUniversalTableViewCell"
    let segueFriendsToFoto = "fromFriendsToFoto"
    var friendsArray = [friend]()
    var searchFriendsArray = [friend]()
    var searchFlag = false
    
    func myFriendsArray() -> [friend] {
        if searchFlag {
            return searchFriendsArray
        }
        return friendsArray
    }
    
    func extractFirstSimbol () -> [String] {

        var resultArray = [String]()
        
        for item in myFriendsArray() {
            let nameLetter = String(item.nameFriend.prefix(1))
            if !resultArray.contains(nameLetter) {
                resultArray.append(nameLetter)
            }
        }
       return resultArray
        }

    func filteredOnCharacter (letter : String) -> [friend]{
        var resultArray = [friend]()
        
        for item in myFriendsArray() {
            let nameLetter = String(item.nameFriend.prefix(1))
            if nameLetter == letter {
                resultArray.append(item)
            }
        }
       return resultArray
    }
    
    func config(userArray:[friend]){
        
        self.friendsArray = userArray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Мои друзья"
        FriendsTableView.reloadData()
     
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.FriendsTableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifireUniversalTableViewCell)
        
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
        searchBar.delegate = self

        friendsArray = friendsArray.sorted(by: {$0.nameFriend < $1.nameFriend})
    }
}

extension MyFriendsViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.isEmpty {
            searchFlag = false
        }
        else {
            searchFlag = true
            searchFriendsArray = friendsArray.filter({ item in
                item.nameFriend.lowercased().contains(searchText.lowercased())
            })
        }
        FriendsTableView.reloadData()
    }
}


extension MyFriendsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return extractFirstSimbol().count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return resoultFriendsArray.count
        return filteredOnCharacter(letter: extractFirstSimbol()[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifireUniversalTableViewCell, for: indexPath) as? UniversalTableViewCell else { return UITableViewCell()}
        
        let arrayByLetterItems = filteredOnCharacter(letter: extractFirstSimbol()[indexPath.section])
        cell.configureCell(user: arrayByLetterItems[indexPath.row])
        cell.animateAvatar()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == segueFriendsToFoto,
            let dst = segue.destination as? FotoController,
            let user = sender as? friend {
            dst.fotoArray = user.fotoArrayFriend
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableViewCell,
              let cellObject = cell.saveObject as? friend
              else {return}
        navigationItem.title = cellObject.nameFriend
    performSegue(withIdentifier: segueFriendsToFoto, sender: cellObject)
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return extractFirstSimbol()[section].uppercased()
    }
}


