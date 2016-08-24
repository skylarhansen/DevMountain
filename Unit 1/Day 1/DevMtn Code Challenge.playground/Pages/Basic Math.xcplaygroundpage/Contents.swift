/*:
## Basic Math

Demonstrate basic knowledge of functions that take parameters and return results by implementing some basic math functions.
*/
//: Write a function that returns the sum of two numbers
func sum(a: Int, b: Int) -> Int {
  return a + b
}
//: Write a function that returns the product of two numbers
func product(a: Int, b: Int) -> Int {
  return a * b
}
//: Write a function that returns the average (mean) of an array of numbers
func averageOf(numbers: [Int]) -> Double {
  var sum = 0
  
  for number in numbers {
    sum += number
  }
  
  return Double(sum) / Double(numbers.count)
}
//: Demo the use of your functions here:
sum(a: 2, b: 3)
product(a: 5, b: 5)
averageOf(numbers: [4, 9, 32, 98])
//: [Previous](@previous)
//: [Next](@next)
