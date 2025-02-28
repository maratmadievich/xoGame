//
//  GameViewController.swift
//  XO-game
//
//  Created by Evgeny Kireev on 25/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit


protocol GameViewInput: UIViewController {
    func firstPlayerTurnLabel(hide: Bool)
    func secondPlayerTurnLabel(hide: Bool)
    
    func winnerLabel(hide: Bool)
    func winnerLabel(text: String)
}



class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var restartButton: UIButton!
    
    let gameboard = Gameboard()
    lazy var referee = Referee(gameboard: self.gameboard)
    
    var currentPlayer: Player = .first
    
    var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.switchToFirstState()
        
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            
            self.currentState.addMark(at: position)
            
            self.switchToNextState()
        }
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        
        self.gameboard.clear()
        self.gameboardView.clear()
        
        self.currentPlayer = .first
        
        self.switchToFirstState()
    }
    
    // MARK: - State machine
    
    func switchToFirstState() {
        self.swithToPlayerInputState(with: .first)
    }
    
    func switchToNextState() {
        
        if false == self.currentState.isCompleted { return }
        
        if let winner = self.referee.determineWinner() {
            self.switchToFinishedState(with: winner)
        
        } else if self.gameboard.areAllPositionsFullfilled() {
            self.switchToFinishedState(with: nil)
            
        } else {
            self.currentPlayer = self.currentPlayer.next
            self.swithToPlayerInputState(with: self.currentPlayer)
            
        }
    }
    
    func swithToPlayerInputState(with player: Player) {
        let prototype = player.markViewPrototype
        switch player {
        case .first:
            prototype.lineColor = .red
        case .second:
            prototype.lineColor = .green
        }
        prototype.layoutSubviews()
        
        self.currentState = PlayerInputState(player: player,
                                             inputState: self,
                                             gameboard: self.gameboard,
                                             gameboardView: self.gameboardView)
    }
    
    func switchToFinishedState(with winner: Player?) {
        self.currentState = GameFinishedState(winner: winner, inputState: self)
    }
}


extension GameViewController: GameViewInput {
    
    func firstPlayerTurnLabel(hide: Bool) {
        self.firstPlayerTurnLabel.isHidden = hide
    }
    func secondPlayerTurnLabel(hide: Bool) {
        self.secondPlayerTurnLabel.isHidden = hide
    }
    
    func winnerLabel(hide: Bool)  {
        self.winnerLabel.isHidden = hide
    }
    func winnerLabel(text: String) {
        self.winnerLabel.text = text
    }
}
