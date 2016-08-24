//: Playground - noun: a place where people can play

import UIKit

class Person: Equatable {
  let firstName: String
  let lastName: String
  let age: Int
  
  init(firstName: String, lastName: String, age: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
}

func ==(lhs: Person, rhs: Person) -> Bool {
  
  return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.age == rhs.age
  
}

let james = Person(firstName: "James", lastName: "Pacheco", age: 26)
let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)
let jairo = Person(firstName: "Jairo Eli", lastName: "de Leon", age: 24)
let sophia = Person(firstName: "Aaron", lastName: "de Leon", age: 10)

var clubMembers: [Person] = [james, andrea, carol, jairo]

func areYouAMemberOfTheClub(person: Person) -> Bool {
  return clubMembers.contains(person)
}

areYouAMemberOfTheClub(person: jairo)
areYouAMemberOfTheClub(person: sophia)
