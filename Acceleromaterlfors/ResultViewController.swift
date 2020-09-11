//
//  ResultViewController.swift
//  Acceleromaterlfors
//
//  Created by 森田貴帆 on 2020/09/11.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var accelertionX: Double!
    @IBOutlet var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result: Double = fabs(accelertionX!*100)
        label.text = String(format: "%.1f°", result)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
