//
//  ShapeView.swift
//  XO-game
//
//  Created by Марат Нургалиев on 09/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

public class ShapeView: UIView {
	private let shapeSize: CGFloat = 120
	private let cornerRadius: CGFloat = 60
	private let disableColor = UIColor.darkText
	
	public var enableColor = UIColor.white
	
	// MARK: - Init
	public init() {
		super.init(frame: CGRect(origin: .zero,
								 size: CGSize(width: shapeSize, height: shapeSize)))
		initProperties()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initProperties()
	}
	
	private func initProperties() {
		self.layer.cornerRadius = cornerRadius
		self.backgroundColor = disableColor
	}
	
	public func view(hideLight: Bool) {
		self.backgroundColor = hideLight
			? disableColor
			: enableColor
	}
	
}


