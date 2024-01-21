//: [Previous](@previous)

import Foundation

/*
 Given an integer n, find each x such that:
 - 0 <= x <= n
 - n + x = n ^ x
 where ^ denotes Bitwise XOR

 Example
 n = 4
 
 There are four values that meet the criteria:
 4 + 0 = 4 ^ 0 = 4
 4 + 1 = 4 ^ 1 = 5
 4 + 2 = 4 ^ 2 = 6
 4 + 3 = 4 ^ 3 = 7


 */

func sumXor(n: Int) -> Int {
    // Write your code here
    if n == 0 { return 1 }
    var binary = String(n, radix: 2).replacingOccurrences(of: "1", with: "")
    
    return Int(truncating: pow(2, binary.count) as NSDecimalNumber)
}

sumXor(n: 10)
