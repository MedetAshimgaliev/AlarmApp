//
//  SecondViewController.swift
//  Medet's Alarm
//
//  Created by Almaz Suraganov on 24.11.17.
//  Copyright © 2017 Almaz Suraganov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    
    @IBOutlet weak var show_date_lbl: UILabel!
    var dateFormatter : DateFormatter!
    var times: [String] = []
    
    @IBOutlet weak var datePic: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd 'T' hh:mm"
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        vc.dataSource = times
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func datePIcChange(_ sender: Any) {
        let time = dateFormatter.string(from: datePic.date)
        show_date_lbl.text = time
        times.append(time)
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
