//
//  Animals.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 23/06/2021.
//

import Foundation

protocol FlyAble {
    var fly: Bool? { get set }
}

protocol SwimAble {
    var swim: Bool? { get set }
}

class Animals {
    var name: String?
    var legs: Int?

    init(name: String?, legs: Int?) {
        self.name = name
        self.legs = legs
    }
}

class Bird: Animals, FlyAble {
    var fly: Bool?
    var color: String?

    init(name: String?, legs: Int?, fly: Bool?, color: String?) {
        self.fly = fly
        self.color = color
        super.init(name: name, legs: legs)
    }
}

class Duck: Animals, SwimAble {
    var color: String?
    var swim: Bool?

    init(color: String?, swim: Bool?, name: String?, legs: Int?) {
        self.color = color
        self.swim = swim
        super.init(name: name , legs: legs)
    }
}


