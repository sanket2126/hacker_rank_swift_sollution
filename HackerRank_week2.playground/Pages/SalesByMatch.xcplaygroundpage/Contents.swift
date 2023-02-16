import UIKit

//MARK: There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
/*
 n = 7
 ar = [1,2,1,2,1,3,2]
 
 There is one pair of color 1 and one of color 2. There are three odd socks left, one of each color. The number of pairs is 2.
 */

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var dict = [Int: Int]()
    for d in ar {
        dict[d] = (dict[d] ?? 0) + 1
    }
    var pair = 0
    for val in dict {
        if (val.value % 2 == 0) {
            pair += val.value / 2
        } else {
            pair += (val.value - 1) / 2
        }
    }
    return pair
}

/*
 Input
 n = 9
 ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]
 
 Output
 3
 */

// MARK: Zig Zag sequence is in C++
