
//MARK: 442. Find All Duplicates in an Array

//https://leetcode.com/problems/find-all-duplicates-in-an-array/description/?envType=daily-question&envId=2024-03-25

func findDuplicates(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var num = nums
    for e in num {
        let index = abs(e) - 1
        
        if num[index] < 0 {
            result.append(abs(e)) // or it can be (index + 1)
        }

        num[index] *= -1
    }
    return result
}

print(findDuplicates([4,3,2,1,8,2,3,7]))

