//
//  GameViewController.swift
//  Acceleromaterlfors
//
//  Created by 森田貴帆 on 2020/09/11.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    @IBOutlet private weak var awaImageView:UIImageView!
    let motionManager = CMMotionManager()
    var accelertionX: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        if motionManager.isAccelerometerAvailable {//加速度計は使えるか
            motionManager.accelerometerUpdateInterval = 0.01//加速度の取得間隔を設定
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data,error) in
                self.accelertionX = (data?.acceleration.x)!
                self.awaImageView.center.x = self.awaImageView.center.x - CGFloat(self.accelertionX!*20)
                if self.awaImageView.frame.origin.x < 40{//泡の画像が水平器からはみ出さないように
                    self.awaImageView.frame.origin.x = 40
                }
                if self.awaImageView.frame.origin.x > 260{
                    self.awaImageView.frame.origin.x = 260
                }
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
               let resultViewController:ResultViewController = segue.destination as! ResultViewController
               resultViewController.accelertionX = self.accelertionX
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
