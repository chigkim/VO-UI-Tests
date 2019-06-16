//
//  ViewController.swift
//  VOCustomAction
//
//  Created by Chi Kim on 6/14/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var hiddenLabel: NSTextFieldCell!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		hiddenLabel.setAccessibilityElement(false)
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

