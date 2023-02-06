//: [Previous](@previous)

import Foundation

//MARK: Given a square matrix, calculate the absolute difference between the sums of its diagonals.

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    let firstDiag = arr.enumerated().map { $1[$0] }.reduce(0, +)
    let secondDiag = arr.enumerated().map { $1.reversed()[$0] }.reduce(0, +)
    let diff = firstDiag - secondDiag
    return abs(diff)
    
}

/*
 INPUT
 3
 11 2 4
 4 5 6
 10 8 -12
 
 OUTPUT
 15
 */
