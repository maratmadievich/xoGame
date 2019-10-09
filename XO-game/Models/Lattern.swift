//
//  Lattern.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

public enum Lattern: CaseIterable {
	case green
	case yellow
	case red
	case reverseYellow
	
	
	var next: Lattern {
		switch self {
		case .green: return .yellow
		case .yellow: return .red
		case .red: return .reverseYellow
		case .reverseYellow: return .green
		}
	}
}
