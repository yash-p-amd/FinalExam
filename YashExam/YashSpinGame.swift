//
//  YashSpinGame.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

import UIKit

class YashSpinGame: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var YashSpinButton: UIButton!
    @IBOutlet weak var YashGameSpiner: UIPickerView!
    
    
    private var YashSpinImages:[UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

        YashSpinImages = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        arc4random_stir()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func YashspinTheGame(_ sender:UIButton)
    {
        var YashWinFlag = false
        var YashNumberInRow = -1
        var YashLastValue = -1
        
        for i in 0..<5 {
            let YashRecentValue = Int(arc4random_uniform(UInt32(YashSpinImages.count)))
            if YashRecentValue == YashLastValue {
                YashNumberInRow += 1
            } else {
                YashNumberInRow = 1
            }
            YashLastValue = YashRecentValue
            
            YashGameSpiner.selectRow(YashRecentValue, inComponent: i, animated: true)
            YashGameSpiner.reloadComponent(i)
            if YashNumberInRow >= 3 {
                YashWinFlag = true
            }

            if(YashWinFlag)
            {
                let YashAlertView = UIAlertController(title: "You Win", message: "Hurree!", preferredStyle: .alert)
                let YashAlertAction = UIAlertAction(title: "Thank You", style: .default, handler: nil)
                YashAlertView.addAction(YashAlertAction)
                present(YashAlertView, animated: true, completion: nil)
            }
        }
        
        func YashshowSpinButton() {
            YashSpinButton.isHidden = false
        }

    }

    
    ///TextFiled Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return YashSpinImages.count
    }
 
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let YashImage = YashSpinImages[row]
        let YashImageView = UIImageView(image: YashImage)
        return YashImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
