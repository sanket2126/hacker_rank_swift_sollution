
// MARK: 1137. N-th Tribonacci Number

//https://leetcode.com/problems/n-th-tribonacci-number/description/?envType=daily-question&envId=2024-04-24

class Solution {
    var t = [0,1,1]
    var result = 0

    func tribonacci(_ n: Int) -> Int {
        if n < 3 { return t[n] }
        for i in 2..<n {
            t.append(t[i-2] + t[i-1] + t[i])
        }
        print(t.last ?? 0)
        return t.last ?? 0
    }
}

var sol = Solution()
sol.tribonacci(4)

sol.tribonacci(25)
