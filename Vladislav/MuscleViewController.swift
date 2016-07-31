//
//  MuscleViewController.swift
//  Vladislav
//
//  Created by Mirco Gysin on 31/07/16.
//  Copyright © 2016 Mirco Gysin. All rights reserved.
//

import UIKit

class MuscleViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var muscleName: UILabel!
    @IBOutlet weak var ans0: UILabel!
    @IBOutlet weak var ans1: UILabel!
    @IBOutlet weak var ans2: UILabel!
    @IBOutlet weak var o0: UIButton!
    @IBOutlet weak var o1: UIButton!
    @IBOutlet weak var o2: UIButton!
    @IBOutlet weak var o3: UIButton!
    @IBOutlet weak var i0: UIButton!
    @IBOutlet weak var i1: UIButton!
    @IBOutlet weak var i2: UIButton!
    @IBOutlet weak var i3: UIButton!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        print("Button Pressed!")
        sender.selected = !sender.selected
    }
    

}
