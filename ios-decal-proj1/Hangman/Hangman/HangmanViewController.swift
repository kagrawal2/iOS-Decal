//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var hangMan: UIImageView!
    @IBOutlet weak var guesses: UILabel!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var submitGuess: UIButton!
    @IBOutlet weak var letterGuess: UITextField!
    
    var phrase : String?
    var phraseArr : [Character]?
    var phraseBools : [Bool]?
    var setWord = Set<String>()
    var setGuesses = Set<String>()
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        phrase = hangmanPhrases.getRandomPhrase()
        print(phrase!)
        phraseArr = [Character](phrase!.characters)
        phraseBools = [Bool](repeating: false, count: phraseArr!.count)
        for charac in phraseArr! {
            setWord.insert(String(charac))
        }
        for i in 0...(phraseArr!.count - 1) {
            if (String(phraseArr![i]) == " ") {
                phraseBools![i] = true
            }
        }
        counter = 1
        let hangname = "hangman" + String(counter)
        print(hangname)
        let hangImage = UIImage(named: hangname)
        hangMan.image = hangImage
        showWord()
    }
    
    func showWord() {
        word.text = ""
        for i in 0...(phraseArr!.count - 1) {
            if phraseBools![i] {
                word.text = word.text! + String(phraseArr![i]) + " "
            } else {
                word.text = word.text! + "- "
            }
        }
        guesses.text = "Guesses: " + Array(setGuesses).joined(separator: " ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessEntered(_ sender: UIButton) {
        if let guessCharacter = letterGuess.text?.uppercased() {
            if letterGuess.text!.characters.count < 2 {
                
            if (setWord.contains(guessCharacter)) {
                for i in 0...(phraseArr!.count - 1) {
                    if guessCharacter.contains(String(phraseArr![i])) {
                        phraseBools![i] = true;
                    }
                }
                
                if isWin() {
                    
                    // create the alert
                    let alert = UIAlertController(title: "You Win!", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let winAction = UIAlertAction(title: "New Game", style: UIAlertActionStyle.default) { UIAlertAction in self.startNewGame()
                    }
                    // add an action (button)
                    alert.addAction(winAction)
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            } else if !(setGuesses.contains(guessCharacter)) {
                setGuesses.insert(guessCharacter)
                counter += 1
                print(counter)
                if counter > 0 && counter < 7 {
                    //keep playing
                    let hangname = "hangman" + String(counter)
                    let hangImage = UIImage(named: hangname)
                    print(hangname)
                    hangMan.image = hangImage
                    
                } else if counter >= 7 {
                    //you lose and start new game
                    
                    // create the alert
                    let alert = UIAlertController(title: "You Lose", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let loseAction = UIAlertAction(title: "New Game", style: UIAlertActionStyle.default) { UIAlertAction in self.startNewGame()
                    }
                    // add an action (button)
                    alert.addAction(loseAction)
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
            }
                
            }
            
            
        }
        
        letterGuess.text = ""
        showWord()
        
    }
    
    func isWin() -> Bool {
        return !phraseBools!.contains(false)
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        startNewGame()
    }
    
    func startNewGame() {
        let hangmanPhrase = HangmanPhrases()
        phrase = hangmanPhrase.getRandomPhrase()
        phraseArr = [Character](phrase!.characters)
        phraseBools = [Bool](repeating: false, count: phraseArr!.count)
        word.text = ""
        guesses.text = "Guesses: "
        setWord = Set<String>()
        setGuesses = Set<String>()
        counter = 1
        for i in 0...(phraseArr!.count - 1) {
            if (String(phraseArr![i]) == " ") {
                phraseBools![i] = true
            }
        }
        for charac in phraseArr! {
            setWord.insert(String(charac))
        }
        let hangname = "hangman" + String(counter)
        let hangImage = UIImage(named: hangname)
        hangMan.image = hangImage
        showWord()
    }

    @IBAction func letterEntered(_ sender: UITextField) {
        if letterGuess.text!.characters.count > 1 {
            letterGuess.text = ""
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // User finished typing (hit return): hide the keyboard.
        textField.resignFirstResponder()
        return true
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
