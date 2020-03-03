//
//  SignUpViewController.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2020/01/13.
//  Copyright © 2020 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
      
    }

  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func didTapButton() {
        var error : NSError? = nil
        NCMBUser.requestAuthenticationMail(emailTextField.text, error: &error)
        
        let alertController = UIAlertController(title: "メール認証", message: "メールを送信しましたので、引き続きご登録をお願いします。", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action: UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
            
        }
        alertController.addAction(okAction)
        present(alertController,animated: true,completion: nil)
        
        if (error != nil) {
          print(error ?? "")
        }
    }
    
    
}











