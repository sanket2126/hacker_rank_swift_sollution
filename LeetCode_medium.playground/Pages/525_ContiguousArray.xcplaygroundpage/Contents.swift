
//MARK: 525. Contiguous Array

//https://leetcode.com/problems/contiguous-array/description/?envType=daily-question&envId=2024-03-16
/*
Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
*/

import Foundation

func findMaxLength(_ nums: [Int]) -> Int {
    var maximum = 0, count = 0
    var dict: [Int:Int] = [0:-1]
    
    for (i,e) in nums.enumerated() {
        count += (e == 0 ? -1 : 1)
        if let d = dict[count] {
            maximum = max(maximum, i - d)
        } else {
            dict[count] = i
        }
    }
    
    return maximum
}

print(findMaxLength([0,0,1,0,0,0,1,1]))
print(findMaxLength([0,1,0]))
