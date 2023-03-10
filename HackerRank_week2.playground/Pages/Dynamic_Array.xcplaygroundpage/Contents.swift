
/*
 Declare a 2-dimensional array,arr , of n empty arrays. All arrays are zero indexed.
 Declare an integer, lastAnswer , and initialize it to 0.

 There are 2 types of queries, given as an array of strings for you to parse:
 
 Query: 1 x y
 Let idx = ((x^lastAnswer) % n).
 Append the integer y to arr[idx] .
 
 Query: 2 x y
 Let idx = ((x^lastAnswer) % n).
 Assign the value arr[idx][y % size(arr[idx])] to lastAnswer.
 Store the new value of lastAnswer to an answers array.

 */

import Foundation

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    var arr: [[Int]] = Array(repeating: [Int](), count: n)
    var lastAnswer: Int = 0
    var result = [Int]()
    
    for q in queries {
        let x = q[1]
        let y = q[2]
        let pos = (x ^ lastAnswer) % n
        
        if q[0] == 1 {
            arr[pos].append(y)
        } else {
            let seq = arr[pos]
            lastAnswer = seq[y % seq.count]
            result.append(lastAnswer)
        }
    }
    return result
}

/*
 Input
 2 5 // n = 2 and size of array given below is 5
 1 0 5
 1 1 7
 1 0 3
 2 1 0
 2 1 1
 
 Output
 7
 3
 
 */
