//: [Previous](@previous)

import Foundation

//MARK: Given an array of integers, where all elements but one occur twice, find the unique element.

func lonelyinteger(a: [Int]) -> Int {
    // Write your code here
    var counts: [Int: Int] = [:]
    for item in a {
        counts[item] = (counts[item] ?? 0) + 1
    }
    return (counts.filter({ $1 == 1 }).first?.key ?? 0)
}

/*
 INPUT
 [1,2,3,4,3,2,1]
 
 Output
 4
 
 */
