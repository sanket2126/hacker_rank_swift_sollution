
//MARK: 3005. Count Elements With Maximum Frequency

//https://leetcode.com/problems/count-elements-with-maximum-frequency/description/?envType=daily-question&envId=2024-03-08

func maxFrequencyElements(_ nums: [Int]) -> Int {
    var max = 0
    var sum = 0
    var freqDict = [Int:Int]()
    for n in nums {
        freqDict[n, default: 0] += 1
    }
    for (_,f) in freqDict {
        if f > max {
            max = f
            sum = f
        } else if f == max {
            sum += f
        }
    }
    return sum
}

// TEST
print(maxFrequencyElements([1,2,2,3,1,4]))

print(maxFrequencyElements([1,2,3,4,5]))
