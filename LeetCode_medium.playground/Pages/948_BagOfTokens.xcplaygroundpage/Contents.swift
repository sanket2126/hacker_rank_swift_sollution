// MARK: 948. Bag of Tokens

//https://leetcode.com/problems/bag-of-tokens/description/?envType=daily-question&envId=2024-03-04

func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
    var arr = tokens.sorted()
    var start = 0, end = tokens.count - 1
    var score = 0, maxm = 0
    var pow = power
    
    while (start <= end) {
        if (pow >= arr[start]) {
            pow -= arr[start]
            score += 1
            start += 1
            maxm = max(score,maxm)
        } else if (score > 0) {
            pow += arr[end]
            score -= 1
            end -= 1
        } else {
            return maxm
        }
    }
    return maxm
}

print("Result", bagOfTokensScore([100,200,300,400], 200))

print("Result", bagOfTokensScore([100], 50))

print("Result", bagOfTokensScore([200, 100], 150))

