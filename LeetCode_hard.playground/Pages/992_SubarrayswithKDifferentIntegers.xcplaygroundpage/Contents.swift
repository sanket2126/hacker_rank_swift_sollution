
// MARK: 992. Subarrays with K Different Integers

//https://leetcode.com/problems/subarrays-with-k-different-integers/description/?envType=daily-question&envId=2024-03-30

func subarrayCounter(_ nums: [Int], _ k: Int) -> Int {
    var dict = [Int:Int]()
    var l = 0 , r = 0, count = 0

    while (r < nums.count) {
        dict[nums[r], default: 0] += 1
        while dict.count > k {
            dict[nums[l], default: 0] -= 1
            if dict[nums[l]] == 0 {
                dict.removeValue(forKey: nums[l])
            }
            l += 1
        }
        count += (r-l+1)
        r += 1
    }
    return count
}

func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
    return subarrayCounter(nums, k) - subarrayCounter(nums, k-1)
}

print("K distinct sub array", subarraysWithKDistinct([1,2,1,2,3], 2))
print("K distinct sub array", subarraysWithKDistinct([1,2,1,3,4], 3))
