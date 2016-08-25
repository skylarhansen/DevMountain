//: Playground - noun: a place where people can play

import UIKit

/*
 
 PART 1
 
 Make an array of 10 Ints Make a function that takes a parameter of Int Array and loops through the array. If the value is below 50, print "low". Otherwise, print "high." Make an array of 10 Ints and test your function by passing it this array to be sure that it works.
 
 Now add an if statement to your loop so that if the value is divisible by 13 it also prints "didn't learn this one in school," otherwise print "that's easy." NOTE: you may want to create a "print" variable and add to it every time we add a new piece of logic, i.e. let printStatement = "", then start adding to it printStatement = printStatement + "low", etc.
 
 Add another if statement to your loop so that if the value is greater than the previous value it also prints "getting bigger" otherwise print "it's stopped growing" (for the first value, you can compare it to 0).
 
 An example of the print statement would be low, that's easy, getting bigger.
 
 PART 2
 
 Change your code to use ternary operators (see "Ternary Conditional Operator" in the Swift Programming Guide)
 
 PART 3
 
 Create two optional values, one set to nil and one not set to nil, and use “nil coalescing” (also see documentation or the Swift Programming Guide) to unwrap each optional value (in place of if let)
 
 
*/

var ints = [1, 2, 3, 4, 55, 6, 7, 8, 9, 10]

func loopsThroughInt(array: [Int]) {
  
  var printStatement = ""
  var compareNumber = 0
  
  for int in array {
    printStatement = int < 50 ? printStatement + "\(int) is low, " : printStatement + "\(int) is high, "
    
    printStatement = int % 13 == 0 ? printStatement + "didn't learn this one in school, " :  printStatement + "That's easy, "
    
    printStatement = int > compareNumber ? printStatement + "getting bigger" : printStatement + "It's stopped growing"
    
    compareNumber = int
    printStatement += "\n"
  }
  print(printStatement)
}
loopsThroughInt(array: ints)

var a: String? = nil
var b: String? = "This is not nil"

print(a ?? "this is set to nil")
print(b ?? "This is set to nil")
