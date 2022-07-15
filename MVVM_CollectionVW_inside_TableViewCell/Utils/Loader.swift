//
//  Loader.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import Foundation
import UIKit

struct ProgressDialog {
    static var alert = UIAlertController()
    static var progressView = UIProgressView()
    static var progressPoint : Float = 0{
        didSet{
            if(progressPoint == 1){
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension UIViewController{
    
    func LoadingStart(){
        ProgressDialog.alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
    
       let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
       loadingIndicator.hidesWhenStopped = true
       loadingIndicator.style = UIActivityIndicatorView.Style.medium
       loadingIndicator.startAnimating()

       ProgressDialog.alert.view.addSubview(loadingIndicator)
       present(ProgressDialog.alert, animated: true, completion: nil)
   }

    func LoadingStop(){
        ProgressDialog.alert.dismiss(animated: true, completion: nil)
    }
}
