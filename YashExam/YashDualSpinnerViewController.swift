//
//  YashDualSpinnerViewController.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

import UIKit

class YashDualSpinnerViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource{
//
//    var YashCustomPickerDataNumbers = ["1","2","3","4","5","6","7","8","9","10"]
//    var YashCustomPickerDataStrings = ["A","B","C","D","E","F","G"]
//    var YashCustomDataBind:[String:[String]]!
//    var YashDataKey:[String]!
//    var YashDataValue:[String]!
//    var YashAlertMsg:String = ""
    
    
    
    var YashDataDict : [String:[String]]!
    var YashStates : [String]!
    var YashZips : [String]!
    var YashAlertMessage : String = ""
    
    @IBOutlet weak var YashButton: UIButton!
    
    @IBOutlet weak var YashDualPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let YashplistURL = Bundle.main.url(forResource:"statedictionary",
                                       withExtension: "plist")
        YashDataDict = NSDictionary.init(contentsOf: YashplistURL!) as! [String : [String]]!
        YashStates = (YashDataDict.keys).sorted()
        YashZips = YashDataDict[YashStates[0]]
        
        YashDualPicker.selectRow(0, inComponent: 0, animated: false)
        YashDualPicker.selectRow(0, inComponent: 1, animated: false)
        YashAlertMessage = YashStates[YashDualPicker.selectedRow(inComponent: 0)] + " " + YashZips[YashDualPicker.selectedRow(inComponent: 1)]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func YashButtonPresed(_ sender:UIButton)
    {
        if(sender == YashButton)
        {
            
            let CustomPicker2Alert = UIAlertController(title: "Warning", message: "Are you sure ? \(YashAlertMessage)", preferredStyle: .alert)
            let CustomPicker2Action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            CustomPicker2Alert.addAction(CustomPicker2Action)
            present(CustomPicker2Alert, animated: true, completion: nil)
        }
    }
    
    
    
    ////Picker Delegate
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {

        if(component==0)
        {
            return YashStates.count
        }
        else
        {
            return YashZips.count
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {

        if(component==0)
        {
            return YashStates[row]
        }
        else
        {
            return YashZips[row]
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {

        if(component==0)
        {
            YashZips = YashDataDict[YashStates[row]]
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: false)
        }
        
        YashAlertMessage = YashStates[pickerView.selectedRow(inComponent: 0)] + " " + YashZips[pickerView.selectedRow(inComponent: 1)]
        
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
