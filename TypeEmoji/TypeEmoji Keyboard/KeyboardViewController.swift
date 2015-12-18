//
//  KeyboardViewController.swift
//  TypeEmoji
//
//  Created by Mitali Chandna on 2015-12-14.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//
import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    var myLexicon = NSMutableDictionary()
    var keyboardType = "Upper"
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.requestSupplementaryLexiconWithCompletion { (theLexicon: UILexicon!) -> Void in let appleLexicon = theLexicon.entries }
        
        createKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    //MARK: Methods
    
    func loadKeysUpper() {
        var keyTitles = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraints(keys, containingView: topRowKeyboard)
        
        keyTitles = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraints(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["⇧","Z", "X", "C", "V", "B", "N", "M", "🔙"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 80, width: 320, height: 40))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraints(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["123", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 120, width: 320, height: 40))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraints(keys, containingView: fourthRowKeyboard)
    }
    
    func loadKeysLower() {
        var keyTitles = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraints(keys, containingView: topRowKeyboard)
        
        keyTitles = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraints(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["⇧", "z", "x", "c", "v", "b", "n", "m", "🔙"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 80, width: 320, height: 40))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraints(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["123", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 120, width: 320, height: 40))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraints(keys, containingView: fourthRowKeyboard)
    }

    func loadKeysNumeric() {
        var keyTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraints(keys, containingView: topRowKeyboard)
        
        keyTitles = ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraints(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["#+=", ".", ",", "?", "!", "'", "🔙"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 80, width: 320, height: 40))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraints(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["ABC", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 120, width: 320, height: 40))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraints(keys, containingView: fourthRowKeyboard)
    }
    
    func loadKeysSpecial() {
        var keyTitles = ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraints(keys, containingView: topRowKeyboard)
        
        keyTitles = ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraints(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["123", ".", ",", "?", "!", "'", "🔙"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 80, width: 320, height: 40))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraints(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["ABC", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 120, width: 320, height: 40))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraints(keys, containingView: fourthRowKeyboard)
    }
    
    func createKeys(keyTitles: [String]) -> [UIButton] {
        var keys = [UIButton]()
        
        for keyTitle in keyTitles {
            let keyButton = UIButton(type: .System) as UIButton
            keyButton.setTitle(keyTitle, forState: UIControlState.Normal)
            keyButton.translatesAutoresizingMaskIntoConstraints = false
            keyButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            keyButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
            keyButton.addTarget(self, action: "keyPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            keys.append(keyButton)
        }
        
        return keys
    }
    
    func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(UIControlState.Normal)
        switch title {
        case "123"?:
            loadKeysNumeric()
            keyboardType = "Numeric"
            break
        case "#+="?:
            loadKeysSpecial()
            keyboardType = "Special"
            break
        case "ABC"?:
            loadKeysLower()
            break
        case "🔙"?:
            (textDocumentProxy as UIKeyInput).deleteBackward()
            break
        case "⇧"? :
            if keyboardType == "Upper" {
                loadKeysLower()
                keyboardType = "Lower"
            }
            else {
                loadKeysUpper()
                keyboardType = "Upper"
            }
            break
        case "🌐"?:
            advanceToNextInputMode()
            break
        case "space"?:
            (textDocumentProxy as UIKeyInput).insertText(" ")
            break
        case "return"?:
            (textDocumentProxy as UIKeyInput).insertText("\n")
            break
        default:
            (textDocumentProxy as UIKeyInput).insertText(title!)
            break
        }
    }
    
    func addConstraints(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: -1)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
                
            } else{
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: buttons[i], attribute: .Width, multiplier: 1.0, constant: 0)
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addNextKeyBoardButton() {
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
    }
    
    func createKeyboard() {
        addNextKeyBoardButton()
        loadKeysUpper()
    }

}
