//
//  main.swift
//  Number system converter
//
//  Created by Steven Zhang on 2021-01-26.
//

import Foundation

//Input

//Get the "From" numberSysytem
print("What number system do you want to convert from")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter you choice (B/O/D/H): ", terminator: "") //Keep following output, On the same line

let from = readLine()!

print("please enter the value to convert: ")
let value = readLine()!

print("What number stsem do you want to convert to ")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter you choice (B/O/D/H): ", terminator: "")

let to = readLine()!

//Process

var startBase = Double()
var endBase = Int()
    
switch from {
    
case "B":
    startBase = 2.0
case "O":
    startBase = 8.0
case "D":
    startBase = 10.0
case "H":
    startBase = 16.0
        default:
            print("Please enter a valid number system")
    }

func Number (value: String) -> Double{
    var exponent = 0.0
    let base = startBase
    var decimalEquivalent = 0.0
    
    for character in value.reversed() {
        switch character{
        case "A":
            decimalEquivalent += 10 * pow(base, exponent)
        case "B":
            decimalEquivalent += 11 * pow(base, exponent)
        case "C":
            decimalEquivalent += 12 * pow(base, exponent)
        case "D":
            decimalEquivalent += 13 * pow(base, exponent)
        case "E":
            decimalEquivalent += 14 * pow(base, exponent)
        case "F":
            decimalEquivalent += 15 * pow(base, exponent)
        case "G":
            decimalEquivalent += 16 * pow(base, exponent)
        default:
            let digit = Double(String(character))!
            decimalEquivalent += digit * pow(base, exponent)
        }
        exponent += 1
    }
    return decimalEquivalent
}

switch to {
case "B":
    endBase = 2
case "O":
    endBase = 8
case "D":
    endBase = 10
case "H":
    endBase = 16
        default:
            print("Please enter a valid number system")
    }

enum NumberSystemBase: Int {
    case binary = 2
    case octal = 8
    case decimal = 10
    case hexadecimal = 16
}

func getaBinaryRepresentation (of valueToConvert: Int, Base: NumberSystemBase)-> String {
    
    var decimalValueLeftToConvert = valueToConvert
    var Representation = ""


    //The absraction we will use is a loop
    //One end condition is that the decimalValueToConvert is equal to zero
    //SO long as the condition is true, the block of codesurround by the {  } Brackets wil be rund repeatly
    while decimalValueLeftToConvert > 0 {
     
        let nextDigit = decimalValueLeftToConvert % Base.rawValue
      
        if Base == .hexadecimal {
        //carefully set the next digit, using ABCDEF
        //Switch statement evaluate some value
            switch nextDigit {
            case 0...9:
                Representation = String (nextDigit) + Representation
            case 10:
                Representation = "A" + Representation
            case 11:
                Representation = "B" + Representation
            case 12:
                Representation = "C" + Representation
            case 13:
                Representation = "D" + Representation
            case 14:
                Representation = "E" + Representation
            case 15:
                Representation = "F" + Representation

            default:
                break
            }
        } else {
              Representation = String (nextDigit) + Representation
        }
            
        
        decimalValueLeftToConvert = decimalValueLeftToConvert / Base.rawValue
    }

    return Representation
}

print("The answer is")
print (getaBinaryRepresentation)
