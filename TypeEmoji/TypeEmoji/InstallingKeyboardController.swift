//
//  InstallingKeyboardController.swift
//  TypeEmoji
//
//  Created by Mitali Chandna on 2015-12-26.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//

import UIKit

class InstallingKeyboardController: UIViewController {

    
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container1.layer.borderWidth = 2.0
        container1.layer.borderColor = UIColor.blackColor().CGColor
        
        container2.layer.borderWidth = 2.0
        container2.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
