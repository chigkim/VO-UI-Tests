//
//  AppDelegate.swift
//  VOCustomAction
//
//  Created by Chi Kim on 6/14/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSSpeechSynthesizerDelegate {
	
	
	func notify(_ message:String) {
		let announcement = [NSAccessibility.NotificationUserInfoKey.announcement:message, NSAccessibility.NotificationUserInfoKey.priority:"Low"]
		NSAccessibility.post(element: NSApplication.shared.mainWindow?.firstResponder?.accessibilityFocusedUIElement! as Any, notification: NSAccessibility.Notification.announcementRequested, userInfo: announcement)
	}
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		if NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.VoiceOver").count == 0 {
			let speech:NSSpeechSynthesizer = NSSpeechSynthesizer()
			speech.delegate = self
			speech.startSpeaking("Please run VoiceOver with command+f5 to use this app.")
		}
	}
	
	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
		NSApplication.shared.terminate(self)
	}
	
}

