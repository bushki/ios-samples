//
//  ViewController.swift
//  Click Counter
//
//  Created by Luis on 10/12/18.
//  Copyright © 2018 Bushki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Draw UI with code
        
        let countLabel = UILabel()
        countLabel.frame = CGRect(x:150, y:150, width: 60, height: 60)
        countLabel.text = "0"
        //add label to view heirarchy
        view.addSubview(countLabel)
        self.label = countLabel
        
        //increment button
        let incrementButton = UIButton();
        incrementButton.frame = CGRect(x:150, y:250, width: 120, height: 60)
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(incrementButton) //add button to view
        //hook up button to target function
        incrementButton.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        
        //add second action to increment button to change background color
        incrementButton.addTarget(self, action: #selector(ViewController.changeBackgroundColor), for: UIControlEvents.touchUpInside)
        
        //decrement button
        let decrement = UIButton();
        decrement.frame = CGRect(x:150, y:300, width: 120, height: 60)
        decrement.setTitle("Decrement", for: .normal)
        decrement.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(decrement)
        //hook up button to target function
        decrement.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)


    }
    
    @objc func incrementCount()
    {
        self.count += 1
        self.label.text = "\(self.count)"
    }
    
    @objc func decrementCount()
    {
        self.count -= 1
        self.label.text = "\(self.count)"
    }
    
    @objc func changeBackgroundColor()
    {
        self.view.backgroundColor = UIColor.random()
    }
}

//generate random float
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

