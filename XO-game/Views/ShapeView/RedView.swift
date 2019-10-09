//
//  RedView.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class RedView: ShapeView {
	
	override init() {
		super.init()
		self.enableColor = UIColor.red
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.enableColor = UIColor.red
	}
	
}
