
// MARK: 2441. Largest Positive Integer That Exists With Its Negative

//https://leetcode.com/problems/largest-positive-integer-that-exists-with-its-negative/description/?envType=daily-question&envId=2024-05-02

func findMaxK(_ nums: [Int]) -> Int {
    var maximum = 0, i = 0
    while i < nums.count {
        if nums[i] > maximum && nums.contains([-nums[i]]) {
            maximum = nums[i]
        }
        i += 1
    }

    return (maximum == 0) ? -1 : maximum
}

print("O/P", findMaxK([-1,2,-3,3]))

print("O/P", findMaxK([-1,10,6,7,-7,1]))

print("O/P", findMaxK([-10,8,6,7,-2,-3]))
