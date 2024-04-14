
// MARK: 2962. Count Subarrays Where Max Element Appears at Least K Times

//https://leetcode.com/problems/count-subarrays-where-max-element-appears-at-least-k-times/description/?envType=daily-question&envId=2024-03-29

import Foundation

func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var l = 0, r = 0, count = 0, result = 0
    var maxEle = nums.max() ?? 0

    while r < nums.count {
        if nums[r] == maxEle {
            count += 1
        }
        while (count > k) || (l<r && count == k && nums[l] != maxEle) {
            if nums[l] == maxEle {
                count -= 1
            }
            l += 1
        }

        if k == count {
            result += l+1
        }
        r += 1
    }
    return result
}

func countSubarrays_2(_ nums: [Int], _ k: Int) -> Int {
    var l = 0, r = 0, count = 0, result = 0
    var maxEle = nums.max() ?? 0

    while r < nums.count {
        if nums[r] == maxEle {
            count += 1
        }
        while (count == k) {
            if nums[l] == maxEle {
                count -= 1
            }
            l += 1
        }

        result += l
        r += 1
    }
    return result
}

print("COUNT",countSubarrays([1,3,2,3,3], 2))
print("COUNT 2 - ", countSubarrays_2([61,23,38,23,56,40,82,56,82,82,82,70,8,69,8,7,19,14,58,42,82,10,82,78,15,82], 2))
