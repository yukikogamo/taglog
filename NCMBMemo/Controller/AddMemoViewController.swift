//
//  AddMemoViewController.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2019/11/17.
//  Copyright © 2019 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB
import SPAlert

class AddMemoViewController: UIViewController {

    @IBOutlet var oishiibutton:UIButton!
    @IBOutlet var tanosiibutton:UIButton!
    @IBOutlet var kanasiibutton:UIButton!
    @IBOutlet var uresiibutton:UIButton!
    @IBOutlet var turaibutton:UIButton!
    @IBOutlet var samisiibutton:UIButton!
    @IBOutlet var omoroibutton:UIButton!
    @IBOutlet var tukaretabutton:UIButton!
    @IBOutlet var nemuibutton:UIButton!
    @IBOutlet weak var memoTextView: UITextView!
    
    var oishiinum: Int = 0
    var tanoshiinum: Int = 0
    var kanasiinum: Int = 0
    var uresiinum: Int = 0
    var turainum: Int = 0
    var samisiinum: Int = 0
    var omoroinum: Int = 0
    var tukaretanum: Int = 0
    var nemuinum: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //削除のところとタップのところ確認
    var number : Double = 0.0
    
    
    @IBAction func oishii() {
        number = number + 0.5
        
        oishiinum = oishiinum + 1
        if oishiinum % 2 == 0{
            //通常の画像赤
            let image = UIImage(named: "button.png")
            let state = UIControl.State.normal

            oishiibutton.setBackgroundImage(image, for: state)
            oishiinum = 0
        }else{
            print("あ")
            //押されてる時の画像青
            let image = UIImage(named: "button2.png")
            let state = UIControl.State.normal
            oishiibutton.setBackgroundImage(image, for: state)
            oishiinum == oishiinum
        }
        
    }
    
    @IBAction func tanosii() {
        number = number + 1.0
        
        tanoshiinum = tanoshiinum + 1
        print("楽しいが押された")
        if tanoshiinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            tanosiibutton.setBackgroundImage(image, for: state)
             tanosiibutton.titleLabel?.text = "たのしい"
                    tanoshiinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   tanosiibutton.setBackgroundImage(image, for: state)
                    tanoshiinum == tanoshiinum
             tanosiibutton.titleLabel?.text = "たのしい"
                }
       
    }
    
    @IBAction func kanasii() {
        number = number - 0.5
        
        kanasiinum = kanasiinum + 1
        print("悲しいが押された")
        if kanasiinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            kanasiibutton.setBackgroundImage(image, for: state)
             kanasiibutton.titleLabel?.text = "かなしい"
                    kanasiinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   kanasiibutton.setBackgroundImage(image, for: state)
                    kanasiinum == kanasiinum
             kanasiibutton.titleLabel?.text = "かなしい"
                }
        
    }
    
    @IBAction func uresii() {
        number = number + 0.8
        
        uresiinum = uresiinum + 1
        print("うれしいが押された")
        if uresiinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            uresiibutton.setBackgroundImage(image, for: state)
             uresiibutton.titleLabel?.text = "うれしい"
                    uresiinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   uresiibutton.setBackgroundImage(image, for: state)
                    uresiinum == uresiinum
             uresiibutton.titleLabel?.text = "うれしい"
                }
    }
    
    @IBAction func turai() {
        number = number - 0.8
        
        turainum = turainum + 1
        print("つらいが押された")
        if turainum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            turaibutton.setBackgroundImage(image, for: state)
             turaibutton.titleLabel?.text = "つらい"
                    turainum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   turaibutton.setBackgroundImage(image, for: state)
                    turainum == turainum
             turaibutton.titleLabel?.text = "つらい"
                }
    }
    
    @IBAction func samisii() {
        number = number - 1.0
        
        samisiinum = samisiinum + 1
        print("さみしいが押された")
        if samisiinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            samisiibutton.setBackgroundImage(image, for: state)
             samisiibutton.titleLabel?.text = "さみしい"
                    samisiinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   samisiibutton.setBackgroundImage(image, for: state)
                    samisiinum == samisiinum
             samisiibutton.titleLabel?.text = "さみしい"
                }
    }
    
    @IBAction func omoroi() {
        number = number + 1.2
        
        omoroinum = omoroinum + 1
        print("おもろいが押された")
        if omoroinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            omoroibutton.setBackgroundImage(image, for: state)
             omoroibutton.titleLabel?.text = "おもろい"
                    omoroinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   omoroibutton.setBackgroundImage(image, for: state)
                    omoroinum == omoroinum
             omoroibutton.titleLabel?.text = "おもろい"
                }
    }
    
    @IBAction func tukareta() {
        number = number - 0.5
        
        tukaretanum = tukaretanum + 1
        print("つかれたが押された")
        if tukaretanum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            tukaretabutton.setBackgroundImage(image, for: state)
             tukaretabutton.titleLabel?.text = "つかれた"
                    tukaretanum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   tukaretabutton.setBackgroundImage(image, for: state)
                    tukaretanum == tukaretanum
             tukaretabutton.titleLabel?.text = "つかれた"
                }
    }
    
    @IBAction func nemui() {
        number = number - 0.1
        
        nemuinum = nemuinum + 1
        print("ねむいが押された")
        if nemuinum % 2 == 0{
                    //通常の画像赤
                    let image = UIImage(named: "button.png")
                    let state = UIControl.State.normal

         
            nemuibutton.setBackgroundImage(image, for: state)
             nemuibutton.titleLabel?.text = "ねむい"
                    nemuinum = 0
                }else{
                    //押されてる時の画像青
                    let image = UIImage(named: "button2.png")
                    let state = UIControl.State.normal

                   nemuibutton.setBackgroundImage(image, for: state)
                    nemuinum == nemuinum
             nemuibutton.titleLabel?.text = "ねむい"
                }
    }
    
    @IBAction func post() {
        if number <= 0 {
            memoTextView.text = "今日は悲しい日だった"
        } else if number > 0 && number < 0.5 {
            memoTextView.text = "今日は普通の日だった"
        } else {
            memoTextView.text = "今日は良い日だった"
        }
    }

    @IBAction func save() {
        let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil {
                SPAlert.present(title: "The Internet connection appears to be offline", preset: .done)
            } else {
                SPAlert.present(title: "Added to Library", preset: .done)
                    self.navigationController?.popViewController(animated: true)
            }
        })
    }
   

}
