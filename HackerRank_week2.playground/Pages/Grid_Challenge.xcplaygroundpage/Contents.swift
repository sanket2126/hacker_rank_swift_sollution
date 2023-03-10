//: [Previous](@previous)

import Foundation

/*
 Given a square grid of characters in the range ascii[a-z], rearrange elements of each row alphabetically, ascending. Determine if the columns are also in ascending alphabetical order, top to bottom. Return YES if they are or NO if they are not.
 

 */

func gridChallenge(grid: [String]) -> String {
    let arrString = grid.map({ $0.sorted() })

    var flag = true
outterLoop: for i in 0..<grid.count-1 {
        for (j,e) in arrString[i].enumerated() {
            let next = arrString[i+1]
            if e > next[j] {
                flag = false
                break outterLoop
            }
        }
    }
    
    return (flag ? "YES" : "NO")
}
/*
 
 Input
 a b c
 a d e
 e f g
 
 Output
 YES
 
 Input
 grid = ['ebacd', 'fghij', 'olmkn', 'trpqs', 'xywuv']
 
 sorted the input
 abcde
 fghij
 klmno
 pqrst
 uvwxy
 
 Output
 Yes
 
 */
