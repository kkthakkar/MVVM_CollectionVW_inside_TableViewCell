//
//  TableViewCell.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import Foundation
import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    //IBOutlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cvHeight: NSLayoutConstraint!
    var user: User!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
    }
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell {
 
            //set images from api response
            cell.backgroundColor = .gray
            let item = user.items[indexPath.row]
            let url = URL(string: item)
            let image = UIImageView()
            image.frame = CGRect(x: 0, y: 0, width: cell.contentView.frame.size.width, height: cell.contentView.frame.size.height)
            image.sd_setImage(with: url)
            cell.addSubview(image)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if user.items.count % 2 == 0 {
            //even items count
            return CGSize(width: (UIScreen.main.bounds.width/2) - 20, height: (UIScreen.main.bounds.width/2) - 20)
        } else {
            //odd items count
            if indexPath.item == 0 {
                return CGSize(width:collectionView.frame.size.width - 20 , height: collectionView.frame.size.width - 20)
            }else{
                return CGSize(width: (UIScreen.main.bounds.width/2) - 20, height: (UIScreen.main.bounds.width/2) - 20)
            }
        }
    }

    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
