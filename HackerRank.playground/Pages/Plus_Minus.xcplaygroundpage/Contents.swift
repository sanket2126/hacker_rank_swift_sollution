//: [Previous](@previous)
import Foundation

//MARK: Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with  places after the decimal.

//Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of up to  are acceptable.

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    let count : Double = Double(arr.count)
    let negative : Double = Double(arr.filter({ $0 < 0 }).count)
    let positive : Double = Double(arr.filter({ $0 > 0 }).count)
    let zeros : Double = Double(arr.filter({ $0 == 0 }).count)
    
    print(String(format: "%.6f", (positive/count)))
    print(String(format: "%.6f", (negative/count)))
    print(String(format: "%.6f", (zeros/count)))
}

/*
 Example
 STDIN           Function
 -----           --------
 6               arr[] size n = 6
 -4 3 -9 0 4 1   arr = [-4, 3, -9, 0, 4, 1]
 
 OUTPUT
 --------
 0.500000
 0.333333
 0.166667
 
 */
// https://www.hackerrank.com/challenges/one-month-preparation-kit-plus-minus/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=one-month-preparation-kit&playlist_slugs%5B%5D=one-month-week-one
