
// MARK: 2444. Count Subarrays With Fixed Bounds

//https://leetcode.com/problems/count-subarrays-with-fixed-bounds/?envType=daily-question&envId=2024-03-31

func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
    var l = -1 , r = -1, k = -1
    var answer = 0
    
    for (i,n) in nums.enumerated() {
        if (n < minK || n > maxK) {
            k = i
        }
        if (n == minK) {
            l = i
        }
        if (n == maxK) {
            r = i
        }
        let cnt = min(r, l)-k
        if cnt > 0 {
            answer += cnt
        }
    }
    return answer
}

print("Subbarrays ", countSubarrays([1,1,1,1], 1, 1))
print("Subbarrays ", countSubarrays([1,3,5,2,7,5], 1, 5))
print("Subbarrays ", countSubarrays([1,3,4,5,2,7,1,4,5], 1, 5))
print("Subbarrays ", countSubarrays([35054,398719,945315,945315,820417,945315,35054,945315,171832,945315,35054,109750,790964,441974,552913], 35054, 945315))
