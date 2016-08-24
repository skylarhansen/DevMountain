/*:

## Control Flow

Write a function that prints the numbers from 1 to 100. But for multiples of three print “Dev” instead of the number and for the multiples of five print “Mountain”. For numbers which are multiples of both three and five print “DevMountain”.
*/
func DevMountain(min: Int, max: Int) {
  
  for number in min...max {
    
    let result = (number % 3, number % 5)
    
    switch result {
    case (0, 0):
      print("DevMountain")
    case (0, _):
      print("Dev")
    case (_, 0):
      print("Mountain")
    default:
      print("\(number)")
    }
  }
}
//: Demo the use of your function here. Go to View -> Debug Area -> Show Debug Area to see the logged results.
DevMountain(min: 1, max: 100)
//: [Previous](@previous)
//: [Next](@next)
