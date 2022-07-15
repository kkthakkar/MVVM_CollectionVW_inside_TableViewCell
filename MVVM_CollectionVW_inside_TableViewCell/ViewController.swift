//
//  ViewController.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var userViewModel : UsersViewModel!
    private var userList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        LoadingStart()
        self.userViewModel = UsersViewModel()
        self.userViewModel.bindUsersViewModelToController = {
            self.userList = self.userViewModel.userData.data.users
            DispatchQueue.main.async {
                self.tableView.dataSource = self
                self.tableView.reloadData()
                self.LoadingStop()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableViewCell {

            //set user data from API response
            let user = userList[indexPath.row]
            cell.userImage.sd_setImage(with: URL(string: user.image))
            cell.userName.text = user.name
            cell.userImage.backgroundColor = .gray
            cell.user = user

            let height = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            cell.cvHeight.constant = height
            cell.layoutIfNeeded()
            cell.selectionStyle = .none
            return cell
       }
        return UITableViewCell()
    }
}

