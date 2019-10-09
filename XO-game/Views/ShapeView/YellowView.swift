//
//  YellowView.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class YellowView: ShapeView {
	
	override init() {
		super.init()
		self.enableColor = UIColor.yellow
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.enableColor = UIColor.yellow
	}
	
}
