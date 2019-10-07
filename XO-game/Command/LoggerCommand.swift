//
//  LoggerCommand.swift
//  XO-game
//
//  Created by Stanislav Ivanov on 02/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation


// MARK: - Command

class LoggerCommand {
    
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
    
    func execute() {
        LoggerReceiver.shared.log(mesage: self.message)
    }
    
}
