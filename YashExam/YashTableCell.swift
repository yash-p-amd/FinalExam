//
//  YashTableCell.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

import UIKit

class YashTableCell : UITableViewCell
{

    
    @IBOutlet weak var YashL1: UILabel!
    @IBOutlet weak var YashL2: UILabel!
    @IBOutlet weak var YashL3: UILabel!
    var getL1: String = "" {
        didSet {
            if (getL1 != oldValue) {
                YashL1.text = getL1
            }
        }
    }
    
    var getL2: String = "" {
        didSet {
            if (getL2 != oldValue) {
                YashL2.text = getL2
            }
        }
    }
    var getL3: String = "" {
        didSet {
            if (getL3 != oldValue) {
                YashL3.text = getL3
            }
        }
    }
    
}
