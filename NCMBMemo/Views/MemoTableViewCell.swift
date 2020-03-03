//
//  MemoTableViewCell.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2020/01/08.
//  Copyright © 2020 Yukiko Gamo. All rights reserved.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        BaseView.layer.cornerRadius = BaseView.layer.bounds.width / 20.0
        BaseView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var BaseView:UIView!
    @IBOutlet var TextView:UITextView!
    
}
