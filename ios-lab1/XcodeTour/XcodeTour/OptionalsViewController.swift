//
//  OptionalsViewController.swift
//  XcodeTour
//
//  Created by Akilesh Bapu on 1/30/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit
import GameKit
class OptionalsViewController: UIViewController {

    @IBOutlet weak var textOutput: UILabel!
    var successCount = 0
    var didBecomeNull = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func testForOptional(_ sender: Any) {
        
        // TODO: Implement proper usage of optionals to prevent app from crashing
        
        var randomString = "Null String returned"
        if let random = returnStringAtRandom() {
            randomString = random
        }
        passInNonOptional(randomString)
        

        
        successCount += 1
        if (successCount >= 3 && didBecomeNull) {
            textOutput.text = "Good job! You've completed this portion. Move on to the next"
        }
    }
    func passInNonOptional(_ nonOptional: String) {
        textOutput.text = nonOptional
    }
    func returnStringAtRandom() -> String? {
        let randomNumber  = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        if randomNumber == 0 {
            return "Non-Null String Returned. You got lucky! Try again!"
        } else {
            didBecomeNull = true
            textOutput.text = "NULL String Returned. You handled it well! Good job!"
            return nil
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
