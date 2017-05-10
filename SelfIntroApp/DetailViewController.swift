//
//  DetailViewController.swift
//  SelfIntroApp
//
//  Created by Alisher Abdukarimov on 5/9/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var goButtonIsTapped = false
    var name = ""
    var livingThing = ""
    var adj1 = ""
    var noun2 = ""
    var verb1 = ""
    var verb2 = ""
    
    @IBOutlet weak var textViewOutlet: UITextView!
    var collectionOfText: [String] = [
        "Hi as you already know my name is Alisher, and thanks for downloading the app to get to know me better. My interests are: 1st is learning how to code and making amazing apps, 2nd is soccer and sports in general!", "My home town 🌇 is Uzbekistan, Tashkent city, its a beautiful city full of kind, generous and guest loving people. I was born in 1991 on the 17th of October in the capital of Uzbekistan Tashkent. I am proud to be a citizen of my country and can't wait to do my part in developing the country's economy with my new skills!", "Since I am from a country that has many Russian speakers, I learnt Russian and Uzbek pretty easy and then slowly picked up English and Turkish. So which makes it 4 for now but I am learning Swift right now and this is just the beginning! 👻", "I love movies and TV Shows in general. I used to act before and in fact you can check it out on YouTube, it's called Papagandus, and there are some more of them but lets talk about my favorite movies )). \n1st: Game Of Thrones \n2nd: Walking Dead! \n They are amazing, don't you think?"
    ]
    
    
    
    @IBOutlet weak var girlsNameTextField: UITextField!
    @IBOutlet weak var livingThingTextField: UITextField!
    @IBOutlet weak var adjective1TextField: UITextField!
    @IBOutlet weak var noun2TextField: UITextField!
    @IBOutlet weak var verb1TextField: UITextField!
    @IBOutlet weak var verb2TextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        self.navigationItem.title = cellImage
        cellImageView.image = UIImage(named: cellImage)
        upateTextView(input: cellImage)
        changeVisibilityOfButtons()
    }
    
    @IBOutlet var cellImageView:UIImageView!
    
    var cellImage = ""
    
    func upateTextView(input: String) {
        switch input {
        case "Interests":
            textViewOutlet.text = collectionOfText[0]
        case "Town":
            textViewOutlet.text = collectionOfText[1]
        case "Languages":
            textViewOutlet.text = collectionOfText[2]
        case "Shows":
            textViewOutlet.text = collectionOfText[3]
        case "Mad😀Lib":
            changeVisibilityOfButtons()
            if goButtonIsTapped == false{
                textViewOutlet.text = "Hello! Lets Play Mad Lib."
            }else{
                textViewOutlet.text = "THE FAIRLY TALE - \n Once upon a time there was a poor little girl named \(name) who lived in the forest with a(n) \(adj1) \(livingThing).  She was forced to \(verb1) all day  while the \(livingThing) sat around \(verb2). But then one day the little girl found a magic \(noun2). When Lisa picked up the \(noun2), she found that anything she imagined came true. Soon, Lisa was making the \(livingThing) \(verb1) while she choose to sit around and \(verb2). After a while, the girl realized this was not a very \(adj1) thing to do and released the Dog from her spell. They became best friends and \(verb2) every day, living happily ever after."
            }
        default:
            break
        }
    }
    
    
    @IBOutlet weak var goButtonOutlet: UIButton!
    @IBAction func goButtonTapped(_ sender: Any) {
        
        if girlsNameTextField.text == "" && livingThingTextField.text == "" && adjective1TextField.text == "" && noun2TextField.text == "" && verb1TextField.text == "" && verb2TextField.text == ""{
            girlsNameTextField.placeholder = "Please enter a name!"
            livingThingTextField.placeholder = "Please enter noun"
            adjective1TextField.placeholder = "Please enter adj"
            noun2TextField.placeholder = "Please enter noun"
            verb1TextField.placeholder = "Please enter verb1"
            verb2TextField.placeholder = "Please enter verb2"
        }else{
            name = girlsNameTextField.text!
            livingThing = livingThingTextField.text!
            adj1 = adjective1TextField.text!
            noun2 = noun2TextField.text!
            verb1 = verb1TextField.text!
            verb2 = verb2TextField.text!
            goButtonIsTapped = true
            upateTextView(input: "Mad😀Lib")
            goButtonOutlet.alpha = 0
        }
        
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func changeVisibilityOfButtons() {
        if cellImage == "Interests" || cellImage == "Languages" || cellImage == "Shows" || cellImage == "Town" || goButtonIsTapped == true {
            girlsNameTextField.alpha = 0
            livingThingTextField.alpha = 0
            adjective1TextField.alpha = 0
            noun2TextField.alpha = 0
            verb1TextField.alpha = 0
            verb2TextField.alpha = 0
            goButtonOutlet.alpha = 0
        }else if cellImage == "Mad😀Lib" && goButtonIsTapped == false{
            girlsNameTextField.alpha = 1
            livingThingTextField.alpha = 1
            adjective1TextField.alpha = 1
            noun2TextField.alpha = 1
            verb1TextField.alpha = 1
            verb2TextField.alpha = 1
            goButtonOutlet.alpha = 1
        }
    }
    
}
