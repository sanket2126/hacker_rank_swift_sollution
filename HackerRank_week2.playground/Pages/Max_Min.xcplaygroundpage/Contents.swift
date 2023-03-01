//: [Previous](@previous)

import Foundation

/*
 You will be given a list of integers, arr , and a single integer K. You must create an array of length k from elements of arr such that its unfairness is minimized. Call that array arr`. Unfairness of an array is calculated as
    MAX(arr`) - MIN(arr`)
 Where:
 - max denotes the largest integer in arr`.
 - min denotes the smallest integer in arr`.
 */

func maxMin(k: Int, arr: [Int]) -> Int {
    let count = arr.count
    var max = Int.max
    let sort = arr.sorted(by: <)
    
    for i in 0..<(count - k + 1) {
        max = min(max, sort[i + k - 1] - sort[i])
    }
    return max
}

/*
 Input
 K = 4
 arr = [1, 2, 3, 4, 10, 20, 30, 40, 100, 200]
 
 Output
 max(1,2,3,4) - min(1,2,3,4) = 4 - 1 = 3
 */

// NEED TO GO THROUGH
