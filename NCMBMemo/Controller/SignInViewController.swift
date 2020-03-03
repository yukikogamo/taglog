//
//  SignInViewController.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2020/01/13.
//  Copyright © 2020 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        userIdTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signIn() {
        
        print("aaaaa")
        if (userIdTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0 {
            
            NCMBUser.logInWithUsername(inBackground: userIdTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    let alertController = UIAlertController(title: "認証失敗", message: "ユーザー名かパスワードが違います。", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel) { (action: UIAlertAction) in
                       
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController,animated: true,completion: nil)
                    
                    
                } else {
                    if user?.object(forKey: "active") as? Bool == false {
                        SVProgressHUD.setStatus("そのユーザーは退会済みです。")
                    } else {
                        // ログイン成功
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
                        UIApplication.shared.keyWindow?.rootViewController = rootViewController
                        
                        // ログイン状態の保持
                        let ud = UserDefaults.standard
                        ud.set(true, forKey: "isLogin")
                        ud.synchronize()
                    }
                }
            }
        } else {
            let alertController = UIAlertController(title: "", message: "文字数が足りません", preferredStyle: UIAlertController.Style.alert)
                               let okAction = UIAlertAction(title: "OK", style: .cancel) { (action: UIAlertAction) in
                                  
                                   
                               }
                               alertController.addAction(okAction)
                               self.present(alertController,animated: true,completion: nil)
            
        }
        
    }
    
    
    
    @IBAction func forgetPassword() {
        // 置いておく
    }
    
    

}






