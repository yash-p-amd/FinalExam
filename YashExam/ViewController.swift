//
//  ViewController.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var YashTableView: UITableView!
    
    
    var YashCellIden = "DefIdenti"

    let YashCellData = [
        ["Name" : "MacBook Air", "Color" : "Red", "Company" : "Apple"],
        ["Name" : "MacBook Pro", "Color" : "Black","Company" : "Samsung"],
        ["Name" : "iMac", "Color" : "Brown","Company" : "Microsoft"],
        ["Name" : "Mac Mini", "Color" : "Green","Company" : "Google"],
        ["Name" : "Mac Pro", "Color" : "Black","Company" : "Nokia"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        YashTableView.register(YashTableCell.self, forCellReuseIdentifier: YashCellIden)
//        let xib = UINib(nibName: "YashTableCell", bundle: nil)
//        YashTableView.register(xib, forCellReuseIdentifier: YashCellIden)
//        YashTableView.rowHeight = 150
        YashTableView.register(YashTableCell.self, forCellReuseIdentifier: YashCellIden)
        
//        YashTableView.register(YashTableCell.self, forCellReuseIdentifier: YashCellIden) as YashTableCell
        let xib = UINib(nibName: "YashTableCell", bundle: nil)
        YashTableView.register(xib, forCellReuseIdentifier: YashCellIden)
        YashTableView.rowHeight = 150
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    ////TableView Delegates
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return YashCellData.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let Yashcell = tableView.dequeueReusableCell(withIdentifier: YashCellIden, for: indexPath) as! YashTableCell
        
        
        let rowData = YashCellData[indexPath.row]
        Yashcell.getL1 = rowData["Name"]!
        Yashcell.getL2 = rowData["Color"]!
        Yashcell.getL3 = rowData["Company"]!
        
        return Yashcell
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
}

