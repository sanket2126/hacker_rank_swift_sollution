//: [Previous](@previous)

import Foundation

// MARK: There are two n-element arrays of integers, A and B. Permute them into some A` and B` such that the relation A`[i] + B`[i] >= k holds for all i where 0 <= i <= n. There will be q queries consisting of A, B and k. For each query, return YES if some permutation A`, B` satisfying the relation exists. Otherwise, return NO.

func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
    var arrayA = A.sorted(by: <)
    var arrayB = B.sorted(by: >)
    var arrayC : [Int] = []
    
    for (i,e) in arrayA.enumerated() {
        arrayC.append(e + arrayB[i])
    }
    let d = arrayC.filter({ $0 < k })
    return d.isEmpty ? "YES" : "NO"
}
/*
 Input
 3 10        A[] and B[] size n = 3, k = 10
 2 1 3       A = [2, 1, 3]  ->  A` = [1,2,3]
 7 8 9       B = [7, 8, 9]  ->  B` = [9,8,7]
 Output  - YES
 
 Input
 4 5         A[] and B[] size n = 4, k = 5
 1 2 2 1     A = [1, 2, 2, 1]  ->  A` = [1,1,2,2]
 3 3 3 4     B = [3, 3, 3, 4]  ->  B` = [4,3,3,3]
 Output  - NO
 
 */
