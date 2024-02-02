
/*
 
 write program of below
// Input = [10,70,40,30,20,60,80,90]
// Output - {10,90} {70,30} {80,20} {40,60}

 */

func combination(_ nums: [Int]) -> String {
    var combinations: [Int: Int] = [:]
    for n in nums {
        let diff = 100 - n
        if combinations[diff] == nil {
            combinations[n] = diff
        }
    }
    return combinations.map({"{\($0.key), \($0.value)}"}).joined(separator: " ")
}

//print(combination([10,70,40,30,20,60,80,90]))

func commonChars(_ words: [String]) -> [String] {
    var dict = words[0].reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
    var result = [String]()
    
    for index in 1 ..< words.count {
        let tempDict = words[index].reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        
        for item in dict {
            if let value = tempDict[item.key] {
                dict[item.key] = min(value, item.value)
            } else {
                dict[item.key] = nil
            }
        }
    }
    
    dict.forEach { result += Array(repeating: String($0.key), count: $0.value) }
    return result
}

print(commonChars( ["good","hud","mood","fill","till"]))
