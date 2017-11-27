//
//  ViewController.swift
//  Medet's Alarm
//
//  Created by Almaz Suraganov on 23.11.17.
//  Copyright © 2017 Almaz Suraganov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

