//: [Previous](@previous)

import Foundation

// MARK: Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    let aray = arr.sorted(by: <)
    var min = 0
    var max = 0
    
    for (i,d) in aray.enumerated() {
        if i == 0 {
            min += d
        } else if i == (arr.count - 1) {
            max += d
        }  else {
            min += d
            max += d
        }
    }
    print(min, max)
}

/*
 Input
 1 2 3 4 5
 
 Output
 10 14
 */
// https://www.hackerrank.com/challenges/one-month-preparation-kit-mini-max-sum/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=one-month-preparation-kit&playlist_slugs%5B%5D=one-month-week-one
