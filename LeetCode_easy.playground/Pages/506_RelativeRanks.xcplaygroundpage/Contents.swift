
// MARK: 506. Relative Ranks

//https://leetcode.com/problems/relative-ranks/description/?envType=daily-question&envId=2024-05-08

func findRelativeRanks(_ score: [Int]) -> [String] {
    var sorted = score.sorted(by: >)
    var str : [String] = []
    for e in score {
        if let i = sorted.firstIndex(of: e) {
            if i == 0 {
                str.append("Gold Medal")
            } else if i == 1 {
                str.append("Silver Medal")
            } else if i == 2 {
                str.append("Bronze Medal")
            } else {
                str.append("\(i+1)")
            }
        }
    }
    return str
}

// Preffered Approach
func findRelativeRanks_2(_ score: [Int]) -> [String] {
    let sorted = score.sorted(by: >)
    var dict: [Int: String] = [:]
    
    for (index, score) in sorted.enumerated() {
        switch index {
        case 0:
            dict[score] = "Gold Medal"
        case 1:
            dict[score] = "Silver Medal"
        case 2:
            dict[score] = "Bronze Medal"
        default:
            dict[score] = String(index+1)
        }
    }
    
    return score.compactMap { dict[$0] }
}

print("O/P", findRelativeRanks([5,4,3,2,1]))

print("O/P", findRelativeRanks_2([10,3,8,9,4]))
