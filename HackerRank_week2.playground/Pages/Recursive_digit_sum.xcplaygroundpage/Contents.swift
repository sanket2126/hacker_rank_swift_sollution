//: [Previous](@previous)

import Foundation
/*
 We define super digit of an integer x using the following rules:

 Given an integer, we need to find the super digit of the integer.

 If x has only 1 digit, then its super digit is x.
 Otherwise, the super digit of x is equal to the super digit of the sum of the digits of x.
 
 For example, the super digit of 9875 will be calculated as:
     super_digit(9875)       9+8+7+5 = 29
     super_digit(29)     2 + 9 = 11
     super_digit(11)        1 + 1 = 2
     super_digit(2)        = 2
 */

func superDigit(n: String, k: Int) -> Int {
    var s = 0
    var ni = "\(n.reduce(0, { $0 + (Int("\($1)") ?? 0) }))"
    var num = String(repeating: ni, count: k)
    if num.isEmpty { return 0 }
    repeat {
      s = num.reduce(0, { $0 + (Int("\($1)") ?? 0) })
      num = "\(s)"
    } while (s >= 10)
    
    return s
}
