
// MARK: 2958. Length of Longest Subarray With at Most K Frequency

//https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/description/?envType=daily-question&envId=2024-03-28

import Foundation

func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
    var n = nums.count
    var dict: [Int:Int] = [:]
    var i = 0, j = 0, ans = 1
    
    while (j<n) {
        dict[nums[j], default: 0] += 1
        
        while (dict[nums[j], default: 0] > k) {
            dict[nums[i], default: 0] -= 1
            i += 1
        }
        ans = max(ans, j-i+1)
        j += 1
    }
    return ans
}

// Another approach
func maxSubarrayLength_2(_ nums: [Int], _ k: Int) -> Int {
    var dict = [Int:Int]()
    var l = 0
    return nums.indices.reduce(0) { result, r in
        if let c = dict[nums[r]], c == k {
            while l < r && nums[l] != nums[r] {
                dict[nums[l]]! -= 1
                l += 1
            }
            l += 1
        } else {
            dict[nums[r], default:0] += 1
        }
        return max(result, r-l+1)
    }
}

print("Method 1 -", maxSubarrayLength([3,1,1],1))
print("Method 2 -", maxSubarrayLength_2([3,1,1],1))
