//
//  ViewController.swift
//  ThumbExpense
//
//  Created by Desheng Xu on 12/21/15.
//  Copyright © 2015 Desheng Xu. All rights reserved.
//

import UIKit

@IBDesignable
class ThumbExpenseViewController: UIViewController {

    @IBOutlet weak var thumbView: ThumbView! {
        didSet {
            thumbView.addGestureRecognizer(UITapGestureRecognizer(target: thumbView, action: "showPoint:"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("current view has width:\(bounds.size.width)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

