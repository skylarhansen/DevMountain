//: Playground - noun: a place where people can play

import UIKit

func divisible(min: Int, max: Int) {
  
  for number in min...max {
    let result = (number % 3, number % 5)
    
    switch result {
    case (0, 0):
      print("Jairo Eli")
    case (0, _):
      print("Jairo")
    case (_, 0):
      print("Eli")
    default:
      print("\(number)")
    }
  }
}
divisible(min: 1, max: 100)

