//
//  GreenLatternState.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

class CurrentLatternState: LatternState {
	
	private var isCompleted: Bool = false
	private var workTime: Int = 0
	private var currentTime: Int = 0
	
	private weak var inputState: SvetoforViewInput?
	private var lattern: Lattern

	init(lattern: Lattern, inputState: SvetoforViewInput) {
		self.lattern = lattern
		self.inputState = inputState
		self.currentTime = 0
		self.workTime = getWorkTime()
		updateSvetofor()
	}
	
	func needChange() -> Bool {
		currentTime += 1
		isCompleted = currentTime >= workTime
		return isCompleted
	}
	
}

//MARK: - Private
extension CurrentLatternState {
	
	private func updateSvetofor() {
		var needHideGreen = true
		var needHideYellow = true
		var needHideRed = true
		switch lattern {
		case .green:
			needHideGreen = false
		case .red:
			needHideRed = false
		default:
			needHideYellow = false
		}
		inputState?.latternGreen(hide: needHideGreen)
		inputState?.latternYellow(hide: needHideYellow)
		inputState?.latternRed(hide: needHideRed)
	}
	
	private func getWorkTime() -> Int {
		switch lattern {
		case .green: return 30
		case .red: return 15
		case .yellow: return 3
		case .reverseYellow: return 3
		}
	}
	
}
