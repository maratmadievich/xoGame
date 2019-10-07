//
//  LoggerReceiver.swift
//  XO-game
//
//  Created by Stanislav Ivanov on 02/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation


// MARK: - Receiver

class LoggerReceiver {
    
    static let shared: LoggerReceiver = LoggerReceiver()
    
    
    func log(mesage: String) {
        debugPrint(mesage)
    }
    
}
