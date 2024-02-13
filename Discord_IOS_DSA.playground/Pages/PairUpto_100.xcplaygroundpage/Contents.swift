
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

print(combination([10,70,40,30,20,60,80,90]))s
