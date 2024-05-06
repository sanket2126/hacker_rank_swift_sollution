// MARK: 42. Trapping Rain Water

//https://leetcode.com/problems/trapping-rain-water/description/?envType=daily-question&envId=2024-04-12

func trap(_ height: [Int]) -> Int {
    var maxIdx = -1
    var max = -1
    for idx in 0..<height.count {
        if height[idx] > max {
            max = height[idx]
            maxIdx = idx
        }
    }
    var min = height[0]
    var result = 0
    for idx in 0..<maxIdx {
        if height[idx] <= min {
            result += min - height[idx]
        } else {
            min = height[idx]
        }
    }
    min = height[height.count - 1]
    for idx in stride(from: height.count - 1, to: maxIdx, by: -1) {
        if height[idx] <= min {
            result += min - height[idx]
        } else {
            min = height[idx]
        }
    }
    return result
}

print("O/P ", trap([0,1,0,2,1,0,1,3,2,1,2,1]))

print("O/P ", trap([4,2,0,3,2,5]))
