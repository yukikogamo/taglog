//
//  ListViewController.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2019/11/17.
//  Copyright © 2019 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD
import TransitionButton

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

    var memoArray = [NCMBObject]()
    var objectID: String!
    let orangeColor = UIColor(red: 250/255, green: 129/255, blue: 57/255, alpha: 1.0)
    @IBOutlet var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MemoTableViewCell", bundle: Bundle.main)
        memoTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        memoTableView.rowHeight = 150
        
        memoTableView.dataSource = self
        memoTableView.delegate = self
        
        memoTableView.tableFooterView = UIView()
        
        setRefreshControl()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
  //スワイプして報告する
   
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
      let reportButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
        self.loadData()
            let query = NCMBQuery(className: "Memo")
        
        query?.getObjectInBackground(withId: self.memoArray[indexPath.row].objectId, block: { (post, error) in
                    if error != nil {
                       
                    } else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "削除", message: "投稿を削除しますか？", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
                                alertController.dismiss(animated: true, completion: nil)
                            }
                            let deleteAction = UIAlertAction(title: "OK", style: .default) { (acrion) in
                                post?.deleteInBackground({ (error) in
                                    if error != nil {
                                       
                                    } else {
                                        tableView.deselectRow(at:indexPath, animated: true)
                                        self.loadData()
                                        self.memoTableView.reloadData()
                                    }
                                })
                            }
                            
                            alertController.addAction(cancelAction)
                            alertController.addAction(deleteAction)
                            self.present(alertController,animated: true,completion: nil)
                            tableView.isEditing = false
                        }
                       
                    }
                })
          
      }
      reportButton.backgroundColor = UIColor.red
      return[reportButton]
  }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MemoTableViewCell
            
            cell.TextView.backgroundColor = UIColor(red: 250/255, green: 129/255, blue: 57/255, alpha: 1.0)
            cell.TextView?.text = memoArray[indexPath.row].object(forKey: "memo") as? String
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "toDetail", sender: nil)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // 次の画面の取得
            if segue.identifier == "toDetail" {
                let detailViewController = segue.destination as! DetailViewController
                
                let selectedIndex = memoTableView.indexPathForSelectedRow!
                
                detailViewController.selectedMemo = memoArray[selectedIndex.row]
            } else if segue.identifier == "Add" {
                let controller = segue.destination as!
                AddMemoViewController
                
                controller.transitioningDelegate = self
                controller.modalPresentationStyle = .popover
                
            }
            
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            print(indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func loadData() {
            let query = NCMBQuery(className: "Memo")
            
            query?.findObjectsInBackground({ (result, error) in
                if error != nil {
                    print(error)
                } else {
                    
                    self.memoArray = result as! [NCMBObject]
                    for object in self.memoArray{
                        self.objectID = object.objectId
                        
                    }
                    
                    self.memoTableView.reloadData()
                }
            })
        }
        
        func setRefreshControl() {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(reloadTimeline(refreshControl:)), for: .valueChanged)
            memoTableView.addSubview(refreshControl)
        }
        
        @objc func reloadTimeline(refreshControl: UIRefreshControl) {
            refreshControl.beginRefreshing()
            // 更新が早すぎるので2秒遅延させる
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.memoTableView.reloadData()
                refreshControl.endRefreshing()
            }
        }
    
    @IBAction func showMenu() {
        let alertController = UIAlertController(title: "メニュー", message: "メニューを選択して下さい。", preferredStyle: .actionSheet)
        
        let signOutAction = UIAlertAction(title: "ログアウト", style: .default) { (action) in
            NCMBUser.logOutInBackground({ (error) in
                if error != nil {
                    SVProgressHUD.showError(withStatus: error!.localizedDescription)
                } else {
                    // ログアウト成功
                    let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
                    let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
                    UIApplication.shared.keyWindow?.rootViewController = rootViewController
                    
                    // ログイン状態の保持
                    let ud = UserDefaults.standard
                    ud.set(false, forKey: "isLogin")
                    ud.synchronize()
                }
            })
        }
        
        let deleteAction = UIAlertAction(title: "退会", style: .default) { (action) in
            
            let alert = UIAlertController(title: "会員登録の解除", message: "本当に退会しますか？退会した場合、再度このアカウントをご利用頂くことができません。", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                // ユーザーのアクティブ状態をfalseに
                if let user = NCMBUser.current() {
                    user.setObject(false, forKey: "active")
                    user.saveInBackground({ (error) in
                        if error != nil {
                            SVProgressHUD.showError(withStatus: error!.localizedDescription)
                        } else {
                            // userのアクティブ状態を変更できたらログイン画面に移動
                            let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
                            let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
                            UIApplication.shared.keyWindow?.rootViewController = rootViewController
                            
                            // ログイン状態の保持
                            let ud = UserDefaults.standard
                            ud.set(false, forKey: "isLogin")
                            ud.synchronize()
                        }
                    })
                } else {
                    // userがnilだった場合ログイン画面に移動
                    let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
                    let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
                    UIApplication.shared.keyWindow?.rootViewController = rootViewController
                    
                    // ログイン状態の保持
                    let ud = UserDefaults.standard
                    ud.set(false, forKey: "isLogin")
                    ud.synchronize()
                }
                
            })
            
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            })
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(signOutAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
        
}
