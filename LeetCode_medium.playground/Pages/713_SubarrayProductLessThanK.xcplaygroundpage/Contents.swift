
// MARK: 713. Subarray Product Less Than K

//https://leetcode.com/problems/subarray-product-less-than-k/?envType=daily-question&envId=2024-03-27

import Foundation

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k <= 1 { return 0 }
    
    var count = 0, i = 0, j = 0
    var product = 1
    let n = nums.count
    
    while j < n {
        product *= nums[j]
        while product >= k {
            product /= nums[i]
            i += 1
        }
        count += (j - i + 1)
        j += 1
    }
    return count
}

print(numSubarrayProductLessThanK([10,5,2,6], 100))
print(numSubarrayProductLessThanK([10,2,2,5,4,4,4,3,7,7], 289))
print(numSubarrayProductLessThanK([10,9,10,4,3,8,3,3,6,2,10,10,9,3], 19))
