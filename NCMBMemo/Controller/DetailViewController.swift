//
//  DetailViewController.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2019/11/17.
//  Copyright © 2019 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB
import SPAlert

class DetailViewController: UIViewController {
    
    var selectedMemo: NCMBObject!
    
    @IBOutlet var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo.object(forKey: "memo") as! String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func delete() {
        selectedMemo.deleteInBackground { (error) in
            if error != nil {
                SPAlert.present(title: "The Internet connection appears to be offline", preset: .done)
            } else {
                // 削除成功
                SPAlert.present(title: "Deleted from Library", preset: .done)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
