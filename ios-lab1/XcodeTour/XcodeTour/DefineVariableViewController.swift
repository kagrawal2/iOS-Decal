import UIKit

class DefineVariableViewController: UIViewController {

    // Define any instance variables here
    var formatTextArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        getTextToDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func matchTheArrayHere() {
        performSegue(withIdentifier: "toNice", sender: nil)
    }
    
    func getTextToDisplay() {
        let data1 = [1701013838, 1919899424, 1847602283, 1830844271, 543520367, 1948282479, 1752440943, 1701716069, 1931506808, 1701273972]
        let data2 = Data(buffer: UnsafeBufferPointer(start: data1, count: data1.count))
        let data3 = NSString(data: data2, encoding: String.Encoding.utf8.rawValue)
        let formattedText = (data3?.capitalized)!
        let formattedTextArray = [formattedText]
        formatTextArray = formattedTextArray
        
        // TODO: Transfer the values in formattedTextArray to the textToDisplay property in our prepare for segue function
        // Hint: How would you store a value if you wanted to access it across different functions?
        

        matchTheArrayHere()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NiceWorkViewController {
            
            // TODO: Assign the destinationVC's textToDisplay property to what was stored in formattedTextArray above
            destinationVC.textToDisplay = formatTextArray // Change this!
        }
    }
}

