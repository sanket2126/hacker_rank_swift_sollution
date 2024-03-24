
// MARK: 287. Find the Duplicate Number

//https://leetcode.com/problems/find-the-duplicate-number/description/?envType=daily-question&envId=2024-03-24

//Recommended - Floyd's Algo O(1) space and O(n) Time complexity
func findDuplicate(_ nums: [Int]) -> Int {
   var slow = nums[0]
   var fast = nums[0]

   repeat {
       slow = nums[slow]
       fast = nums[nums[fast]]

       if slow == fast {
           break
       }
   } while (slow != fast)

   fast = nums[0]
   while slow != fast {
       slow = nums[slow]
       fast = nums[fast]
   }

   return fast
}

func findDuplicate1(_ nums: [Int]) -> Int {
    var nums = nums
    for i in 0..<nums.count{
        var index = abs(nums[i])
        if nums[index] < 0 {
            return index
        }
        nums[index] = -nums[index]
    }

    return -1
}

// O(n) space and time complexity
func findDuplicate2(_ nums: [Int]) -> Int {
    var dict: [Int:Int] = [:]
    for d in nums {
        dict[d, default: 0] += 1
        if dict[d, default: 0]  > 1 {
            return d
        }
    }
    return 0
}

print(findDuplicate([4,3,2,7,6,5,3,1])) // value must be between 1 <= value < n
