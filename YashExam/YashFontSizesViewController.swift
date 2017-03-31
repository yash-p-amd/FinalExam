//
//  YashFontSizesViewController.swift
//  YashExam
//
//  Created by YASH on 2017-03-31.
//  Copyright © 2017 YASH. All rights reserved.
//

import UIKit

class YashFontSizesViewController: UITableViewController {

    var font: UIFont!
    private static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    private static let cellIdentifier = "FontNameAndSize"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = YashFontSizesViewController.pointSizes[0]
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YashFontSizesViewController.pointSizes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: YashFontSizesViewController.cellIdentifier,
            for: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text =
        "\(YashFontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = YashFontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }

}
