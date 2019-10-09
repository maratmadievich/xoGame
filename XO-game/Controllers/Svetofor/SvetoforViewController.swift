//
//  SvetoforViewController.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

protocol SvetoforViewInput: class {
	
	func latternRed(hide: Bool)
	func latternYellow(hide: Bool)
	func latternGreen(hide: Bool)
}

class SvetoforViewController: UIViewController {
	
	@IBOutlet var viewRed: RedView!
	@IBOutlet var viewYellow: YellowView!
	@IBOutlet var viewGreen: GreenView!
	
	private var currentLattern: Lattern = .green
	private var currentState: LatternState!
	
	private var timer: Timer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		switchToFirstState()
		configureTimer()
	}
	
	
}

//MARK: - State Machine
extension SvetoforViewController {
		
	private func switchToFirstState() {
		self.swithToLatternInputState(with: .green)
	}
	
	private func switchToNextState() {
		self.currentLattern = currentLattern.next
		swithToLatternInputState(with: currentLattern)
	}
	
	private func swithToLatternInputState(with lattern: Lattern) {
		self.currentState = CurrentLatternState(lattern: lattern, inputState: self)
	}
	
}

extension SvetoforViewController {
	
	private func configureTimer() {
		if timer == nil {
			timer = Timer.scheduledTimer(timeInterval: 1,
										 target: self,
										 selector: #selector(updateTimer),
										 userInfo: nil,
										 repeats: true)
		}
	}
	
	@objc private func updateTimer() {
		if currentState.needChange() {
			switchToNextState()
		}
	}
	
}


extension SvetoforViewController: SvetoforViewInput {
	
	func latternRed(hide: Bool) {
		viewRed.view(hideLight: hide)
	}
	
	func latternYellow(hide: Bool) {
		viewYellow.view(hideLight: hide)
	}
	
	func latternGreen(hide: Bool) {
		viewGreen.view(hideLight: hide)
	}
	
}
