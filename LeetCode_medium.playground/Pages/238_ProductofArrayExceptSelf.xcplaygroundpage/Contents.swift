
// MARK: 238. Product of Array Except Self

//https://leetcode.com/problems/product-of-array-except-self/description/?envType=daily-question&envId=2024-03-15

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 1, count: nums.count)
    var prefix = 1
    for i in 0..<nums.count {
        result[i] = prefix
        prefix *= nums[i]
    }
    var postfix = 1
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        result[i] *= postfix
        postfix *= nums[i]
    }
    return result
}

func productExceptSelf_2(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var prefix = 1
    for (i,n) in nums.enumerated() {
        var post = nums[(i+1)..<nums.count].reduce(1, *)
        result.append(prefix * post)
        prefix *= n
    }
    return result
}

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf_2([1,2,3,4]))

print(productExceptSelf([1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1]))
print(productExceptSelf_2([1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1]))
