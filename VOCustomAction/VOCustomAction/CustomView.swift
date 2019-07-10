//
//  CustomView.swift
//  VOCustomAction
//
//  Created by Chi Kim on 6/14/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

class CustomView: NSView, NSAccessibilityButton {

	override func isAccessibilityElement() -> Bool {
		return true
	}

	override func accessibilityRole() -> NSAccessibility.Role? {
		return NSAccessibility.Role.checkBox
	}

	override func accessibilitySubrole() -> NSAccessibility.Subrole? {
		return NSAccessibility.Subrole.toggle
	}

	override func accessibilityValue() -> Any? {
		return 1
	}
	
	override func accessibilityCustomActions() -> [NSAccessibilityCustomAction]? {
		let action1 = NSAccessibilityCustomAction(name: "Do Something else", target: self, selector: #selector(doSomethingElse))
		let action2 = NSAccessibilityCustomAction(name: "Do Something", target: self, selector: #selector(doSomething))
		return [action1, action2]
	}
	
	
@objc func doSomething(_ sender:Any) -> Bool {
		DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
			let msg = "Ok, I did something."
			print(msg)
			let app = NSApp.delegate as! AppDelegate
			app.notify(msg)
		})
		return true
	}
	
	@objc func doSomethingElse(_ sender:Any) -> Bool {
		DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
			let msg = "Ok, I did something else."
			print(msg)
			let app = NSApp.delegate as! AppDelegate
			app.notify(msg)
		})
		return true
	}
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		
		// Drawing code here.
	}
	
}
