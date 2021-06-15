//
//  PersonModel.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 14/06/2021.
//

import Foundation

class PersonModel {
    var name: String?
    var age: Int?
    
    init() {
    }
    
    init(name: String?, age: Int?) {
        self.name = name
        self.age = age
    }
}


struct Student {
   var grade : Int?
   var name: String?
    
    init(grade: Int?, name: String?) {
        self.name = name
        self.grade = grade
    }
}


struct Vehicle {
    var name: String?
    
    mutating func editTable(name: String?) {
        self.name = name
    }
}

class Example {
    var example: String?
    
    func editTable(code: String) {
        self.example = code
    }
}


