//
//  TableViewController.swift
//  Medet's Alarm
//
//  Created by Almaz Suraganov on 27.11.17.
//  Copyright © 2017 Almaz Suraganov. All rights reserved.
//

import Foundation
import UIKit


class TableViewController : UITableViewController {
    
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        cell.cellLabel.text = dataSource[indexPath.row]
        return cell
    }
}
