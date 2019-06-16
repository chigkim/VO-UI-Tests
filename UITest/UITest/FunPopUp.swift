//
//  FunPopUpButton.swift
//  UITest
//
//  Created by Chi Kim on 2/21/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

class FunPopUp: NSButton {
	
	var delegate:PopUpDelegate?
	var colorMenu:NSMenu?
	var fruitMenu:NSMenu?
	var petMenu:NSMenu?
	var macOSMenu:NSMenu?
	var androidMenu:NSMenu?
	var ubuntuMenu:NSMenu?
	override var acceptsFirstResponder:Bool { get { return true} }
	
	required init?(coder: NSCoder) {
		super.init(coder:coder)
		let color = ["Color", "Red", "Green", "Blue"]
		colorMenu = buildMenu(withItems:color)
		let fruit = ["Fruit", "Apple", "Banana", "Orange"]
		fruitMenu = buildMenu(withItems:fruit)
		let pet = ["Pet", "Dog", "Cat", "Bird"]
		petMenu = buildMenu(withItems:pet)
		let macOS = ["MacOS", "Yosemite", "Sierra", "Mojave"]
		macOSMenu = buildMenu(withItems:macOS)
		let android = ["Android", "KitKat", "Marshmallow", "Oreo"]
		androidMenu = buildMenu(withItems:android)
		let ubuntu = ["Ubuntu", "Trusty Tahr", "Xenial Xerus", "Bionic Beaver"]
		ubuntuMenu = buildMenu(withItems:ubuntu)
		let action1 = NSAccessibilityCustomAction(name: "Do Something", target: self, selector: #selector(doSomething))
		setAccessibilityCustomActions([action1])
	}
	
	func buildMenu(withItems items:[String]) -> NSMenu {
		let menu = NSMenu(title: "Pick")
		menu.autoenablesItems = false
		items.forEach {
			let start = String.Index(encodedOffset: 0)
			let end = String.Index(encodedOffset: 1)
			let key = String($0[start..<end])
			menu.addItem(withTitle: $0, action: #selector(selectMenu), keyEquivalent: key)
		}
		menu.item(at: 0)!.isEnabled = false
		menu.item(at: 0)!.keyEquivalent = ""
		menu.item(at: 1)!.state = .on
		return menu
	}
	
	func showMenu(_ menu:NSMenu) {
		let p = NSPoint(x: 0, y: frame.height)
		menu.popUp(positioning: nil, at: p, in: self)
	}
	
	@objc func selectMenu(_ sender:NSMenuItem) {
		sender.menu!.items.forEach {
			if $0.title == sender.title {
				$0.state = .on
			} else {
				$0.state = .off
			}
		}
		delegate?.picked(self)
	}
	
	override func mouseDown(with event: NSEvent) {
		if event.modifierFlags == [] {
			showMenu(colorMenu!)
		} else if event.modifierFlags.contains(.control) {
			showMenu(fruitMenu!)
		}
	}
	
	override func rightMouseDown(with event: NSEvent) {
		showMenu(petMenu!)
	}


	override func accessibilityPerformPress() -> Bool {
		showMenu(macOSMenu!)
		return true
	}

	override func accessibilityPerformShowMenu() -> Bool {
		showMenu(androidMenu!)
		return true
	}
	
	override func accessibilityPerformShowAlternateUI() -> Bool {
		showMenu(ubuntuMenu!)
		return true
	}

	override func accessibilityCustomActions() -> [NSAccessibilityCustomAction]? {
		let action1 = NSAccessibilityCustomAction(name: "Do Something", target: self, selector: #selector(doSomething))
		print(accessibilityActionNames())
return [action1]
	}

	@objc func doSomething(_ sender:Any) -> Bool {
print(sender)
		return true
	}

	override func accessibilityRole() -> NSAccessibility.Role? {
		return NSAccessibility.Role.popUpButton
	}


	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		// Drawing code here.
	}
	
}
