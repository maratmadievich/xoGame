//
//  MenuViewController.swift
//  XO-game
//
//  Created by Марат Нургалиев on 07/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
	
	private var gameMode = GameMode.oneMove
	private var gameType = GameType.pvi
	
	private let modeAlertTitle = "Game Mode"
	private let modeAlertMessage = "You need to select game mode"
	
	private let buttonModeOneMove = "Classic"
	private let buttonModeFiveMoves = "5 moves"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func buttonAiGameTapped(_ sender: Any) {
		self.gameType = GameType.pvi
		self.gameMode = GameMode.oneMove
		openGame()
	}
	
	
	@IBAction func buttonHumansGameTapped(_ sender: Any) {
		self.gameType = GameType.pvp
		openModeAlert()
	}
	
	@IBAction func buttonLightTrafficTapped(_ sender: Any) {
		openLightTraffic()
	}
	
	
	
}

//MARK: - Alert
extension MenuViewController {
	
	private func openModeAlert() {
		let alertController = UIAlertController(title: modeAlertTitle, message: modeAlertMessage, preferredStyle: .alert)
		
		let actionOneMove = UIAlertAction(title: buttonModeOneMove, style: .default) { [weak self] (action:UIAlertAction) in
			self?.gameMode = GameMode.oneMove
			self?.openGame()
		}
		
		let actionFiveMoves = UIAlertAction(title: buttonModeFiveMoves, style: .default) { [weak self] (action:UIAlertAction) in
			self?.gameMode = GameMode.fiveMoves
			self?.openGame()
		}
		
		alertController.addAction(actionOneMove)
		alertController.addAction(actionFiveMoves)
		self.present(alertController, animated: true, completion: nil)
	}
	
}

//MARK: - Segue example
extension MenuViewController {
	
	private func openGame() {
		performSegue(withIdentifier: "showGame", sender: nil)
	}
	
	private func openLightTraffic() {
		performSegue(withIdentifier: "showLightTraffic", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showGame" {
			guard let upcoming = segue.destination as? GameViewController else { return }
			let gameSettings = GameSettings(mode: self.gameMode, type: self.gameType)
			upcoming.set(gameSettings: gameSettings)
		}
	}
	
}
