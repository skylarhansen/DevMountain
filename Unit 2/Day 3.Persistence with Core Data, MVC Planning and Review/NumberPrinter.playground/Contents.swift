//: Playground - noun: a place where people can play

/*
 
 
 Create a function that takes an Int as a parameter and prints it to the console the way an old-school alarm clock would look. You may create auxilary functions.
 
 e.g. If you pass 257 the console might look something like this:
 
 
*/

import UIKit

let horizontal = " --- "
let verticalLeft = "|    "
let verticalRight = "    |"
let verticalBoth = "|   |"
let emptySpace = "     "

func numberPrinter(number: Int) {
    
    var numberString = ""
    
    for row in 1...5 {
        for num in String(number).characters {
            switch (row, num) {
            case (1, "0"), (1, "2"), (1, "3"), (1, "5"), (1, "6"), (1, "7"), (1, "8"), (1, "9"), (3, "2"), (3, "3"), (3, "4"), (3, "5"), (3, "6"), (3, "8"), (3, "9"), (5, "0"), (5, "2"), (5, "3"), (5, "5"), (5, "6"), (5, "8"):
                numberString += horizontal + " "
            case (2, "5"), (2, "6"), (4, "2"):
                numberString += verticalLeft + " "
            case (2, "1"), (2, "2"), (2, "3"), (2, "7"), (3, "1"), (3, "7"), (4, "1"), (4, "3"), (4, "4"), (4, "5"), (4, "7"), (4, "9"):
                numberString += verticalRight + " "
            case (2, "0"), (2, "4"), (2, "8"), (2, "9"), (4, "0"), (4, "6"), (4, "8"):
                numberString += verticalBoth + " "
            case (1, "1"), (1, "4"), (3, "0"), (5, "1"), (5, "4"), (5, "7"), (5, "9"):
                numberString += emptySpace + " "
            default:
                break
            }
        }
        numberString += "\n"
    }
    print(numberString)
}
numberPrinter(number: 257)

























