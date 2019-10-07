//
//  Copy.swift
//  XO-game
//
//  Created by Stanislav Ivanov on 02/10/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation


struct VKFriend {
    let title: String
    let age: Int
    
    func copy(newTitle: String) -> VKFriend {
        return VKFriend(title: newTitle, age: self.age)
    }
}



protocol Copying {
    init(_ prototype: Self)
}


extension Copying {
    func makeCopy() -> Self {
        return type(of: self).init(self)
    }
}



