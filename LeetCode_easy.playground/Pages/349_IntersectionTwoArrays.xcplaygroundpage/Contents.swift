
import Foundation

// MARK: 349. Intersection of Two Arrays

//https://leetcode.com/problems/intersection-of-two-arrays/description/?envType=daily-question&envId=2024-03-10

// Approach 1
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    Array(Set(nums1).intersection(Set(nums2)))
}

// Approach 2
func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var output = [Int]()
    var n1 = nums1
    var n2 = nums2
    
    for num in n1 {
        if n2.contains(num) {
            if !output.contains(num){
                output.append(num)
            }
        }
    }
    return output
}

func intersection3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []
    let set1 = Set(nums1)
    
    for num in nums2 {
        if set1.contains(num), !result.contains(num) {
            result.append(num)
        }
    }
    
    return result
}


print(intersection([4,9,5],[9,4,9,8,4]))

print(intersection2([1,2,2,1],[2,2]))

print(intersection3([4,9,5],[9,4,9,8,4]))
