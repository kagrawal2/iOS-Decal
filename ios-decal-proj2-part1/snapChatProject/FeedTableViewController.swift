//
//  FeedTableViewController.swift
//  snapChatProject
//
//  Created by Kireet Agrawal on 3/6/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    
    var imageToView: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        print(threads)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threads.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let genre: String = Array(threads.keys)[section]
        
        print((threads[genre])!)
        return (threads[genre]?.count)!
        //return threadNames.count //incorrect need to index dictionary
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        //let genre = threadNames[indexPath.section]
        let genre: String = Array(threads.keys)[indexPath.section]
        
        let imagePost = threads[genre]?[indexPath.row]
        
        cell.imageLabel.text = (imagePost?.from)!
        //String(describing: threads[genre]?[indexPath.row])
        cell.timeLabel.text = String(Int(NSDate().timeIntervalSince(imagePost?.order as! Date) / 60)) + " Minutes Ago"
        
        if (imagePost?.seen)! {
            cell.readImage.image = UIImage(named: "read")
        } else {
            cell.readImage.image = UIImage(named: "unread")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let genre = threadNames[indexPath.section]
        let genre: String = Array(threads.keys)[indexPath.section]
        
        let imagePost = threads[genre]?[indexPath.row]
        
        if !((imagePost?.seen)!) {
            imageToView = imagePost?.photo!
            imagePost?.seen = true
            performSegue(withIdentifier: "viewImageSegue", sender: "feedView")
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "viewImageSegue") {
            if let nextVC = segue.destination as? ImageViewController {
                if (imageToView != nil) {
                    nextVC.image = imageToView!
                }
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
