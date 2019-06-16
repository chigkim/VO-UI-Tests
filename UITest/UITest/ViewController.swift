//
//  ViewController.swift
//  UITest
//
//  Created by Chi Kim on 2/21/19.
//  Copyright © 2019 Chi Kim. All rights reserved.
//

import Cocoa

protocol PopUpDelegate {
	func picked(_ sender:FunPopUp)
}

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, PopUpDelegate {
	
	@IBOutlet weak var pop: FunPopUp!
	@IBOutlet weak var tableView: NSTableView!
	
	fileprivate enum CellIdentifiers {
		static let TypeCell = "TypeCellID"
		static let ChosenCell = "ChosenCellID"
		static let InstructionCell = "InstructionCellID"
	}
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		return 6
	}
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		var text = ""
		var cellIdentifier = ""
		
		if tableColumn ==  tableView.tableColumns[0] {
			let types = ["Color", "Fruit", "Pet", "MacOS", "Android", "Ubuntu"]
			text = types[row]
			cellIdentifier = CellIdentifiers.TypeCell
		} else if tableColumn ==  tableView.tableColumns[1] {
			let menus = [pop.colorMenu, pop.fruitMenu, pop.petMenu, pop.macOSMenu, pop.androidMenu, pop.ubuntuMenu]
			let selected = menus[row]!.items.filter{$0.state == .on}
			text = selected[0].title
			cellIdentifier = CellIdentifiers.ChosenCell
		} else if tableColumn ==  tableView.tableColumns[2] {
			let instructions = ["Click", "Control-Click", "Right Click", "VO+Space", "VO+Shift+M", "VO+Command+Space"]
			text = instructions[row]
			cellIdentifier = CellIdentifiers.InstructionCell
		}
		if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
			cell.textField?.stringValue = text
			return cell
		}
		return nil
	}
	
	func picked(_ sender:FunPopUp) {
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		tableView.delegate = self
		tableView.dataSource = self
		pop.delegate = self
	}
	
	
	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
			
		}
	}
	
	
}

