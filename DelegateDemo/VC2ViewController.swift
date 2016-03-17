//
//  VC2ViewController.swift
//  DelegateDemo
//
//  Created by DEREK DO on 16/3/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate: class {
    func colorPicker(picker: VC2ViewController, didPickerColor color: UIColor?)
}

class VC2ViewController: UIViewController {
    
    weak var delegate: ColorPickerDelegate?
    
    var initialColor:UIColor?
    
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    
     let colors = [("Cyan", UIColor.cyanColor()),  ("Magenta", UIColor.magentaColor()), ("Yellow", UIColor.yellowColor())]

    @IBAction func doneButtonTapped(sender: AnyObject) {
        delegate?.colorPicker(self, didPickerColor: colorFromSelection())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorSegmentedControl.removeAllSegments()
        var selectedIndex = UISegmentedControlNoSegment
        for(index, color) in colors.enumerate() {
            if(color.1.isEqual(initialColor)){
                selectedIndex = index
            }
            colorSegmentedControl.insertSegmentWithTitle(color.0, atIndex: index, animated: false)
        }
        colorSegmentedControl.selectedSegmentIndex = selectedIndex
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorSegmentedControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return colors[selectedIndex].1
        }
        return nil
    }

}
