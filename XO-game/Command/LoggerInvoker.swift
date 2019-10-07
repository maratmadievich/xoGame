//
//  LoggerInvoker.swift
//  XO-game
//
//  Created by Stanislav Ivanov on 02/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation


// MARK: - Invoker


class LoggerInvoker {
     
    static let shared: LoggerInvoker = LoggerInvoker()
    
    private var commands: [LoggerCommand] = []
    private let batchSize: Int = 5
    
    func addCommand(_ loggerCommand: LoggerCommand) {
        self.commands.append(loggerCommand)
        self.executeIfNeeded()
    }
    
    private func executeIfNeeded() {
        if self.commands.count < self.batchSize { return }
        
        for command in self.commands {
            command.execute()
        }
        
        self.commands.removeAll()
    }
    
}
