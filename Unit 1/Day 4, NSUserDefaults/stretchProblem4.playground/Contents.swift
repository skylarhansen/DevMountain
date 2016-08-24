//: Playground - noun: a place where people can play

import UIKit

class Person {
  
  let nameKey = "name"
  let ageKey = "age"
  let movieKey = "movie"
  
  var name: String?
  var age: Int?
  var favoriteMovie: String?
  
  init?(dictionary: [String: AnyObject]) {
    
    guard let name =
      dictionary[nameKey] as? String,
      let age = dictionary[ageKey] as? Int,
      let favoriteMovie = dictionary[movieKey] as? String else {
      print("Failed to initialize")
      return nil
    }
    
    self.name = name
    self.age = age
    self.favoriteMovie = favoriteMovie
    
  }
}

let workingDictionary: [String: Any] = ["name" : "Derek", "age": 28, "movie" : "Zoolander"]
let brokenDictionary: [String: Any] = ["name" : "Steve", "age": 2]

let personOne = Person(dictionary: workingDictionary as [String : AnyObject])
let personTwo = Person(dictionary: brokenDictionary as [String : AnyObject])
