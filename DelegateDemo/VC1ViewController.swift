//
//  VC1ViewController.swift
//  DelegateDemo
//
//  Created by DEREK DO on 16/3/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class VC1ViewController: UIViewController, ColorPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func colorPicker(picker: VC2ViewController, didPickerColor color: UIColor?) {
        if let selectedColor = color {
            view.backgroundColor = selectedColor
        }
         dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openColorPickerTapped(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let colorPickerVC = storyBoard.instantiateViewControllerWithIdentifier("ColorPicker") as! VC2ViewController
        colorPickerVC.delegate = self
        colorPickerVC.initialColor = view.backgroundColor
        presentViewController(colorPickerVC, animated: true, completion: nil)
        
    }

   
}
