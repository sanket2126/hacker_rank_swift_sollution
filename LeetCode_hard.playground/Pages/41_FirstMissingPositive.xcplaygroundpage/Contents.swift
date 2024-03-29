
// MARK: 41. First Missing Positive

//https://leetcode.com/problems/first-missing-positive/description/?envType=daily-question&envId=2024-03-26

func firstMissingPositive(_ nums: [Int]) -> Int {
    var n = nums.count, i = 0
    var mutableNum = nums

    while i < n {
        let element = mutableNum[i]
        if element > 0 && element <= n {
            let position = element - 1
            if (mutableNum[position] != element) {
                let temp = mutableNum[position]
                mutableNum[position] = mutableNum[i]
                mutableNum[i] = temp

                i -= 1
            }
        }
        i += 1
    }
    
    for i in 0..<n {
        if (i+1) != mutableNum[i] {
            return i+1
        }
    }
    return n+1
}

// 2 Approach
func firstMissingPositive2(_ nums: [Int]) -> Int {
    var nums = nums
    for i in 0..<nums.count {
        while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
            nums.swapAt(nums[i] - 1, i)
        }
    }
    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    return nums.count + 1
}

print("First Missing +ve", firstMissingPositive([1,2,0]))

print("First Missing +ve", firstMissingPositive2([3,4,-1,1]))

print("First Missing +ve", firstMissingPositive([7,8,9,11,12]))
