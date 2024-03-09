
// MARK: 2540. Minimum Common Value

//https://leetcode.com/problems/minimum-common-value/description/?envType=daily-question&envId=2024-03-09

// Approach 1
func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var i = 0
    var j = 0

    while i < nums1.count && j < nums2.count {
        if nums1[i] == nums2[j] {
            return nums1[i]
        }

        if nums1[i] < nums2[j] {
            i += 1
        } else {
            j += 1
        }
    }
    return -1
}

// Approach 2. [Missing the advantage of array being already sorted]
// Need to sort array again once converted from SET

func getCommon2(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var set1 = Set(nums1)
    var set2 = Set(nums2)
    var intersact = set1.intersection(set2)

    return Array(intersact).sorted().first ?? -1
}

// Approach 3
func getCommon3(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let pot = Set(nums2)
    for num in nums1 {
        if pot.contains(num) {
            return num
        }
    }
    return -1
}

// TEST
print("1 Approach -",getCommon([1,2,3,6],[2,3,4,5]))

print("2 Approach -",getCommon2([1,2,3,6],[2,3,4,5]))

print("3 Approach -",getCommon3([1,2,3,6],[2,3,4,5]))
