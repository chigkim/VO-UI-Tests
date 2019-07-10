//
//  ViewController.swift
//  Send Announcement
//
//  Created by Chi Kim on 7/10/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet weak var messageField: NSTextField!
	
	@IBAction func send(_ sender: Any) {
		notify(messageField.stringValue)
	}
	
	func notify(_ message:String) {
		let announcement = [NSAccessibility.NotificationUserInfoKey.announcement:message, NSAccessibility.NotificationUserInfoKey.priority:"High"]
		NSAccessibility.post(element: NSApplication.shared.mainWindow?.firstResponder?.accessibilityFocusedUIElement! as Any, notification: NSAccessibility.Notification.announcementRequested, userInfo: announcement)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
		}
	}
	
	
}

