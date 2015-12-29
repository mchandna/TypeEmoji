//
//  KeyboardViewController.swift
//  TypeEmoji
//
//  Created by Mitali Chandna on 2015-12-14.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//
import UIKit

class KeyboardViewController: UIInputViewController, UITextFieldDelegate {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    var keyboardType:String = "UpperStart"
    var lastKeyPressed: String = ""
    var checking: Bool = false
    var wordToReplace: String = ""
    var emojiWord = NSDictionary()
    var screenSize = CGRect()
    var portrait: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds
        if screenSize.width > screenSize.height {
            portrait = false
        }
        else {
            portrait = true
        }
        createKeyboard()
        keyboardType = "UpperStart"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func textWillChange(textInput: UITextInput?) {
    }
    
    override func textDidChange(textInput: UITextInput?) {
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        screenSize = UIScreen.mainScreen().bounds
        if toInterfaceOrientation == UIInterfaceOrientation.Portrait {
            portrait = true
        }
        else {
            portrait = false
        }
        if keyboardType == "Upper" || keyboardType == "UpperLocked" || keyboardType == "UpperStart" {
            loadKeysUpper()
        }
        else if keyboardType == "Lower" {
            loadKeysLower()
        }
        else if keyboardType == "Numeric" {
            loadKeysNumeric()
        }
        else {
            loadKeysSpecial()
        }
    }
    
    //MARK: Methods
    
    func loadKeysUpper() {
        var heightOfRow: CGFloat = 0
        if portrait == true {
            heightOfRow = 55
        }
        else {
            heightOfRow = 40
        }
        emptySuperView()
        
        var keyTitles = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }

        self.view.addSubview(topRowKeyboard)
        
        addConstraintsRow0(keys, containingView: topRowKeyboard)
        
        keyTitles = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraintsRow1(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["⇧","Z", "X", "C", "V", "B", "N", "M", "⌫"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 2*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraintsRow2(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["123", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
    
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 3*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraintsRow3(keys, containingView: fourthRowKeyboard)
        
        keyboardType = "Upper"
    }
    
    func loadKeysLower() {
        var heightOfRow: CGFloat = 0
        if portrait == true {
            heightOfRow = 55
        }
        else {
            heightOfRow = 40
        }

        
        emptySuperView()
        
        var keyTitles = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraintsRow0(keys, containingView: topRowKeyboard)
        
        keyTitles = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraintsRow1(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["⇧", "z", "x", "c", "v", "b", "n", "m", "⌫"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 2*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraintsRow2(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["123", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 3*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraintsRow3(keys, containingView: fourthRowKeyboard)
        
        keyboardType = "Lower"
    }

    func loadKeysNumeric() {
        var heightOfRow: CGFloat = 0
        if portrait == true {
            heightOfRow = 55
        }
        else {
            heightOfRow = 40
        }

        
        emptySuperView()
        
        var keyTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraintsRow0(keys, containingView: topRowKeyboard)
        
        keyTitles = ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraintsRow0(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["#+=", ".", ",", "?", "!", "'", "⌫"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 2*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraintsRow2Special(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["ABC", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 3*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraintsRow3(keys, containingView: fourthRowKeyboard)
        
        keyboardType = "Numeric"
    }
    
    func loadKeysSpecial() {
        var heightOfRow: CGFloat = 0
        if portrait == true {
            heightOfRow = 55
        }
        else {
            heightOfRow = 40
        }

        emptySuperView()
        
        var keyTitles = ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="]
        var keys = createKeys(keyTitles)
        
        var topRowKeyboard = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            topRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(topRowKeyboard)
        
        addConstraintsRow0(keys, containingView: topRowKeyboard)
        
        keyTitles = ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"]
        keys = createKeys(keyTitles)
        
        var secondRowKeyboard = UIView(frame: CGRect(x: 0, y: heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            secondRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(secondRowKeyboard)
        
        addConstraintsRow0(keys, containingView: secondRowKeyboard)
        
        keyTitles = ["123", ".", ",", "?", "!", "'", "⌫"]
        keys = createKeys(keyTitles)
        
        var thirdRowKeyboard = UIView(frame: CGRect(x: 0, y: 2*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            thirdRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(thirdRowKeyboard)
        
        addConstraintsRow2Special(keys, containingView: thirdRowKeyboard)
        
        keyTitles = ["ABC", "🌐", ":", "space", "return"]
        keys = createKeys(keyTitles)
        
        var fourthRowKeyboard = UIView(frame: CGRect(x: 0, y: 3*heightOfRow, width: screenSize.width, height: heightOfRow))
        
        for key in keys {
            fourthRowKeyboard.addSubview(key)
        }
        
        self.view.addSubview(fourthRowKeyboard)
        
        addConstraintsRow3(keys, containingView: fourthRowKeyboard)
        
        keyboardType = "Special"
    }
    
    func createKeys(keyTitles: [String]) -> [UIButton] {
        var keys = [UIButton]()
        
        for keyTitle in keyTitles {
            let keyButton = UIButton(type: .System) as UIButton
            keyButton.setTitle(keyTitle, forState: UIControlState.Normal)
            if  keyTitle == "123" || keyTitle == "ABC" || keyTitle == "return" || keyTitle == "#+=" || keyTitle == "⌫" || keyTitle == "⇧" || keyTitle == "🌐"{
                keyButton.titleLabel!.font = UIFont(name: "Arial", size: 15.0)
                keyButton.backgroundColor = UIColor.lightGrayColor()
            }
            else if keyTitle == "space" {
                keyButton.titleLabel!.font = UIFont(name: "Arial", size: 15.0)
                keyButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            }
            else {
                keyButton.titleLabel!.font = UIFont(name: "Arial", size: 21.0)
                keyButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            }
            keyButton.translatesAutoresizingMaskIntoConstraints = false
            keyButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
            keyButton.addTarget(self, action: "keyPressed:", forControlEvents: UIControlEvents.TouchDown)
            if keyTitle == "⇧" {
                keyButton.addTarget(self, action: "keyDoublePressed:", forControlEvents: UIControlEvents.TouchDownRepeat)
            }
            keyButton.layer.cornerRadius = 5
            keys.append(keyButton)
        }
        
        return keys
    }
    
    func capsLock() {
        if keyboardType == "Upper" || keyboardType == "UpperStart" || keyboardType == "UpperLocked" {
            loadKeysLower()
        }
        else {
            loadKeysUpper()
        }
    }
    
    func keyDoublePressed(sender: AnyObject?) {
        let button = sender as! UIButton
        loadKeysUpper()
        keyboardType = "UpperLocked"
        button.backgroundColor = UIColor.darkGrayColor()
        button.setTitle("hi", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.lightTextColor(), forState: UIControlState.Normal)
    }
    
    //Figure out word to replace when it comes to backspaces and keyboard changes
    func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(UIControlState.Normal)
        
        //Change animation
        UIView.animateWithDuration(0.2, animations: {
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.0, 2.0)
            }, completion: {(_) -> Void in
                button.transform =
                    CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
        })
        
        switch title {
        case "123"?:
            loadKeysNumeric()
            break
        case "#+="?:
            loadKeysSpecial()
            break
        case "ABC"?:
            loadKeysLower()
            break
        case "⌫"?:
            (textDocumentProxy as UIKeyInput).deleteBackward()
            break
        case "⇧"? :
            capsLock()
            break
        case "🌐"?:
            advanceToNextInputMode()
            break
        case "space"?:
            if lastKeyPressed == "space" {
                (textDocumentProxy as UIKeyInput).deleteBackward()
                (textDocumentProxy as UIKeyInput).insertText(".")
            }
            (textDocumentProxy as UIKeyInput).insertText(" ")
            break
        case "return"?:
            (textDocumentProxy as UIKeyInput).insertText("\n")
            loadKeysUpper()
            break
        default:
            (textDocumentProxy as UIKeyInput).insertText(title!)
            if title == ":" && checking == false {
                checking = true
            }
            else if title == ":" && checking == true {
                wordToReplace = wordToReplace.substringFromIndex(wordToReplace.characters.startIndex.advancedBy(1))
                var numberOfBackSpaces = wordToReplace.characters.count + 2
                for var i = 0; i < numberOfBackSpaces; i++ {
                    (textDocumentProxy as UIKeyInput).deleteBackward()
                }
                
                (textDocumentProxy as UIKeyInput).insertText(getEmoji(wordToReplace))
                
                wordToReplace = ""
                checking = false
            }
            
            if keyboardType == "Upper" || keyboardType == "UpperStart"{
                loadKeysLower()
            }
            
            break
        }
        
        if checking == true {
            createWord(title!)
        }
    
        lastKeyPressed = title!
    }
    
    //Put it in the keyboard
    func addNextKeyBoardButton() {
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchDown)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
    }
    
    func createKeyboard() {
        addNextKeyBoardButton()
        loadKeysUpper()
        getResource()
    }
    
    func createWord(typed: String) {
        switch typed {
        case "123","#+=","ABC","⇧","return":
            break
        case "⌫":
            wordToReplace = wordToReplace.substringToIndex(wordToReplace.characters.endIndex.advancedBy(-1))
            break
        case "🌐":
            wordToReplace = ""
            advanceToNextInputMode()
            break
        case "space":
            wordToReplace = wordToReplace + " "
            break
        default:
            wordToReplace = wordToReplace + typed
            break
        }
        
        if wordToReplace == "" {
            checking = false
        }
    }
    
    func getEmoji(word: String) -> String {
        if emojiWord[word.lowercaseString] != nil {
            return emojiWord[word.lowercaseString]! as! String
        }
        else {
            return word
        }
    }

    func getResource() {
        let path = NSBundle.mainBundle().pathForResource("EmojiWord", ofType: "plist")
        emojiWord = NSDictionary(contentsOfFile: path!)!
    }
    
    func emptySuperView() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
    }
    
//    func addConstraintsRow0(buttons: [UIButton], containingView: UIView){
//        
//        for(var i = 0; i < buttons.count; i++) {
//            
//            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
//            
//            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
//            
//            var leftConstraint : NSLayoutConstraint!
//            
//            if i == 0 {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
//                
//            } else{
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: buttons[i], attribute: .Width, multiplier: 1.0, constant: 0)
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            
//            var rightConstraint : NSLayoutConstraint!
//            
//            if i == buttons.count - 1 {
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
//                
//            } else{
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
//            }
//            
//            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
//        }
//    }
//    
//    func addConstraintsRow1(buttons: [UIButton], containingView: UIView){
//        
//        for(var i = 0; i < buttons.count; i++) {
//            
//            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
//            
//            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
//            
//            var leftConstraint : NSLayoutConstraint!
//            
//            if i == 0 {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: (screenSize.width/20.0))
//                
//            } else {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: buttons[i], attribute: .Width, multiplier: 1.0, constant: 0)
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            
//            var rightConstraint : NSLayoutConstraint!
//            
//            if i == buttons.count - 1 {
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -(screenSize.width/20.0))
//                
//            } else{
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
//            }
//            
//            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
//        }
//    }
//    
//    func addConstraintsRow2(buttons: [UIButton], containingView: UIView){
//        
//        for(var i = 0; i < buttons.count; i++) {
//            
//            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
//            
//            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
//            
//            var leftConstraint : NSLayoutConstraint!
//            
//            if i == 0 {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
//                
//            } else if i == 1 {
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: (screenSize.width/10.0) + (screenSize.width/20.0))
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 1.0, constant:  (-screenSize.width/20.0) + 1)
//                
//                containingView.addConstraint(widthConstraint)
//            } else{
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint: NSLayoutConstraint!
//                if i == buttons.count - 1 {
//                    
//                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: (screenSize.width/20.0)+1)
//                }
//                else {
//                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: 0)
//                }
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            
//            var rightConstraint : NSLayoutConstraint!
//            
//            if i == buttons.count - 1 {
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
//                
//            } else{
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
//            }
//            
//            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
//        }
//    }
//    
//    func addConstraintsRow3(buttons: [UIButton], containingView: UIView){
//        
//        for(var i = 0; i < buttons.count; i++) {
//            
//            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
//            
//            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
//            
//            var leftConstraint : NSLayoutConstraint!
//            
//            if i == 0 {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
//                
//            } else if i == 1 {
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: (screenSize.width/8.0))
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (screenSize.width/8.0)-1)
//                
//                containingView.addConstraint(widthConstraint)
//            } else if i == 2 {
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0.0, constant: (screenSize.width/10.0)-1)
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            else if i == 3 {
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0.0, constant: 2.0*(screenSize.width/5.0)-1)
//                
//                containingView.addConstraint(widthConstraint)
//            } else {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (screenSize.width/4.0)-1)
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            
//            var rightConstraint : NSLayoutConstraint!
//            
//            if i == buttons.count - 1 {
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
//                
//            } else{
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
//            }
//            
//            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
//        }
//    }
//    
//    func addConstraintsRow2Special(buttons: [UIButton], containingView: UIView){
//        
//        for(var i = 0; i < buttons.count; i++) {
//            
//            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
//            
//            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
//            
//            var leftConstraint : NSLayoutConstraint!
//            
//            if i == 0 {
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
//                
//            } else if i == 1 {
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: (screenSize.width/10.0) + (screenSize.width/20.0))
//                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (-(7)*screenSize.width/10.0)/5 + 1)
//                
//                containingView.addConstraint(widthConstraint)
//            } else{
//                
//                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 1)
//                
//                var widthConstraint: NSLayoutConstraint!
//                if i == buttons.count - 1 {
//                    
//                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0, constant: ((3.0)*screenSize.width/20.0)-1)
//                }
//                else {
//                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: 0)
//                }
//                
//                containingView.addConstraint(widthConstraint)
//            }
//            
//            var rightConstraint : NSLayoutConstraint!
//            
//            if i == buttons.count - 1 {
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
//                
//            } else{
//                
//                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -1)
//            }
//            
//            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
//        }
//    }
    
    func addConstraintsRow0(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 10)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 4)
                
            } else{
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: buttons[i], attribute: .Width, multiplier: 1.0, constant: -4)
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -4)
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -4)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addConstraintsRow1(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 10)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: (screenSize.width/20.0))
                
            } else {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: buttons[i], attribute: .Width, multiplier: 1.0, constant: 0)
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -(screenSize.width/20.0))
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -4)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addConstraintsRow2(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 10)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 4)
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: containingView, attribute: .Width, multiplier: 0.0, constant: (screenSize.width/10.0)+(screenSize.width/20.0)-8)
                
                containingView.addConstraint(widthConstraint)

            } else if i == 1 {
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 1.0, constant: (-screenSize.width/20.0)+8-3.5)
                
                containingView.addConstraint(widthConstraint)
            } else{
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint: NSLayoutConstraint!
                if i == buttons.count - 1 {
                    
                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: (screenSize.width/20.0)-4)
                }
                else {
                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: 0)
                }
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -4)
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -4)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addConstraintsRow3(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 10)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: -7)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 4)
                
            } else if i == 1 {
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (screenSize.width/8.0)-4)
                
                containingView.addConstraint(widthConstraint)
            } else if i == 2 {
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0.0, constant: (screenSize.width/10.0)-4)
                
                containingView.addConstraint(widthConstraint)
            }
            else if i == 3 {
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0.0, constant: 2.0*(screenSize.width/5.0)-4)
                
                containingView.addConstraint(widthConstraint)
            } else {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (screenSize.width/4.0)-4)
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -4)
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -4)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addConstraintsRow2Special(buttons: [UIButton], containingView: UIView){
        
        for(var i = 0; i < buttons.count; i++) {
            
            var topConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 10)
            
            var bottomConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            var leftConstraint : NSLayoutConstraint!
            
            if i == 0 {
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 4)
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: containingView, attribute: .Width, multiplier: 0.0, constant: (screenSize.width/10.0)+(screenSize.width/20.0)-8)
                
                containingView.addConstraint(widthConstraint)
                
            } else if i == 1 {
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                var widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[0], attribute: .Width, multiplier: 0.0, constant:  (-(7)*screenSize.width/10.0)/5 - 15)
                
                containingView.addConstraint(widthConstraint)
            } else{
                
                leftConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Left, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Right, multiplier: 1.0, constant: 4)
                
                var widthConstraint: NSLayoutConstraint!
                if i == buttons.count - 1 {
                    
                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 0, constant: ((3.0)*screenSize.width/20.0)-4)
                }
                else {
                    widthConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Width, relatedBy: .Equal, toItem: buttons[i-1], attribute: .Width, multiplier: 1.0, constant: 0)
                }
                
                
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if i == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -4)
                
            } else{
                
                rightConstraint = NSLayoutConstraint(item: buttons[i], attribute: .Right, relatedBy: .Equal, toItem: buttons[i+1], attribute: .Left, multiplier: 1.0, constant: -4)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
}