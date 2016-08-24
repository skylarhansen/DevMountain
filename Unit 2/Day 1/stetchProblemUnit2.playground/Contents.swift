//: Playground - noun: a place where people can play

import UIKit

let currentYear = 2016

struct Person {
  var firstName: String
  var lastName: String
  var birthYear: Int
  
  var age: Int {
    get {
      return currentYear - birthYear
    }
    set {
      birthYear = currentYear - newValue
    }
  }
  
}

let jairo = Person(firstName: "Jairo Eli", lastName: "de León", birthYear: 1991)

print("\(jairo.firstName) \(jairo.lastName)")
print(jairo.birthYear)
print(jairo.age)
