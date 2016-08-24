/*:
## About Me

Tell us a little bit about yourself using Swift variables. Start with your first name, your last name, your age, where you're from, and why you want to take the class.
*/
let firstName = "Jairo Eli"
let lastName = "de León"
var age = 24
let hometown = "Austin, TX"
var reason = "learning to code has confirmed in every way that I am eager to begin a career in iOS development"
//: Create an array of Strings that holds a few of your hobbies.
var hobbies = ["traveling","reading","watching TV shows","hiking"]
/*: 
Programmatically combine the individual strings from your hobbies array into a single string with the hobbies separated by commas.

For example: "Programming, Teaching, Golf, and Basketball."
*/
var myHobbies = "\(hobbies[0]), \(hobbies[1]), \(hobbies[2]), \(hobbies[3])"

//: Using the variables you have created, write a programmatically generated sentence to introduce yourself. Use only one print() statement.
var intro = "My name is \(firstName) \(lastName). I am \(age) years old, and I grew up in \(hometown). Some of my hobbies include \(myHobbies). I want to attend DevMountain because \(reason)."

print(intro)
//: [Previous](@previous)
//: [Next](@next)
