//: Playground - noun: a place where people can play

import UIKit

typealias Velocity = Double

protocol Vehicle {
  var speed: Velocity { get set }
  var isMoving: Bool { get set }
  
  mutating func startMoving()
  mutating func stopMoving()
}

class Lawnmower: Vehicle {
  var speed: Velocity
  var isMoving: Bool
  
  init(speed: Velocity, isMoving: Bool) {
    self.speed = speed
    self.isMoving = isMoving
  }
}

class Truck: Vehicle {
  var speed: Velocity
  var isMoving: Bool
  
  init(speed: Velocity, isMoving: Bool) {
    self.speed = speed
    self.isMoving = isMoving
  }
}

extension Vehicle {
  mutating func startMoving() {
    if !isMoving {
      isMoving = true
      print("The vehicle is now moving")
    }
  }
  
  mutating func stopMoving() {
    if isMoving {
      isMoving = false
      print("The vehicle is no longer moving")
    }
  }
}

var aLawnmower = Lawnmower(speed: 0, isMoving: false)
aLawnmower.startMoving()

var aTruck = Truck(speed: 70, isMoving: true)
aTruck.stopMoving()


