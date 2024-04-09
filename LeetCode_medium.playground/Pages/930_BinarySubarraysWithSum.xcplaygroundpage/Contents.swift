
// MARK: 930. Binary Subarrays With Sum

//https://leetcode.com/problems/binary-subarrays-with-sum/description/?envType=daily-question&envId=2024-03-14

import Foundation

func subArrayCount(_ nums: [Int],_ goal: Int) -> Int {
    if goal < 0 { return 0 }
    var result = 0, left = 0, current = 0
    for (i,r) in nums.enumerated() {
        current += r
        while current > goal {
            current -= nums[left]
            left += 1
        }
        result += (i - left + 1)
    }
    
    return result
}

func numSubarraysWithSum3(_ nums: [Int], _ goal: Int) -> Int {
    return subArrayCount(nums, goal) - subArrayCount(nums, goal-1)
}

func numSubarraysWithSum2(_ nums: [Int], _ goal: Int) -> Int {
    var result = 0
    var pos = 0
    var dict: [Int:Int] = [0:1]
    for (i,r) in nums.enumerated() {
        pos += r
        result += dict[pos-goal, default: 0]
        dict[pos, default: 0] += 1
    }
    return result
}

func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    var res = 0
    var sum = 0
    var counts = [0: 1]
    
    for num in nums {
        sum += num
        if let pairs = counts[sum - goal] {
            res += pairs
        }
        counts[sum, default: 0] += 1
    }
    return res
}

print("Method 1 -",numSubarraysWithSum([1,0,1,0,1], 2))
print("Method 2 -",numSubarraysWithSum2([1,0,1,0,1], 2))
print("Method 3 -",numSubarraysWithSum3([1,0,1,0,1], 2))


print("Method 1 -",numSubarraysWithSum([0,0,0,0,0], 0))
print("Method 2 -",numSubarraysWithSum2([0,0,0,0,0], 0))
print("Method 3 -",numSubarraysWithSum3([0,0,0,0,0], 0))
