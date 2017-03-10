//
//  GenreViewController.swift
//  snapChatProject
//
//  Created by Kireet Agrawal on 3/5/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var genreTableView: UITableView!
    
    var selectedImage: UIImage?
    var selectedGenre: String?
    
    
    @IBOutlet weak var postLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreTableView.dataSource = self
        genreTableView.delegate = self
        genreTableView.rowHeight = 60.0

        // Do any additional setup after loading the view.
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
     */
    
    @IBAction func postButton(_ sender: UIButton) {
        if (selectedImage != nil) {
            if (selectedGenre != nil) {
                let imagePost = ImagePost(ord: NSDate(), phot: selectedImage!, see: false, fro: "Kireet Agrawal")
                threads[selectedGenre!]!.append(imagePost)
                print(threads)
                //threads[selectedGenre!]!.append(selectedImage!)
                postLabel.text = "Post to "
                selectedImage = nil
                
                let alert = UIAlertController(title: "Your Image has been posted", message: "", preferredStyle: UIAlertControllerStyle.alert)
                let postAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { UIAlertAction in self.postedImage()
                }
                // add an action (button)
                alert.addAction(postAction)
                
                self.present(alert, animated: true, completion: nil)
                
                //performSegue(withIdentifier: "returnSegue", sender: "postedToFeed")
            }
        }
    }
    
    func postedImage() {
        performSegue(withIdentifier: "returnSegue", sender: "postedToFeed")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreTableViewCell
        
        cell.genreLabel.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGenre = threadNames[indexPath.row]
        postLabel.text = "Post to " + selectedGenre!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "returnSegue") {
            if let nextVC = segue.destination as? ImagePickerController {
                
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
