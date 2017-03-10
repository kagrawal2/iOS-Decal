//
//  ImageViewController.swift
//  snapChatProject
//
//  Created by Kireet Agrawal on 3/7/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var imageButton: UIButton!
    
    var image: UIImage?
    var timeRemaining: Int = 10
    
    @IBAction func imageTouched(_ sender: Any) {
        performSegue(withIdentifier: "backToFeedSegue", sender: "imageViewed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (image != nil) {
        imageButton.setBackgroundImage(self.image!, for: UIControlState.normal)
        }
        Timer.scheduledTimer(timeInterval: 1.0, target: self,
                             selector: #selector(ImageViewController.updateTimeLabel(_:)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimeLabel (_ timer : Timer) {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
            performSegue(withIdentifier: "backToFeedSegue", sender: "imageViewed")
        }
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
