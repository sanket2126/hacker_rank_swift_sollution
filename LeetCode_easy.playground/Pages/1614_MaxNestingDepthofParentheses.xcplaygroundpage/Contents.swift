
// MARK: 1614. Maximum Nesting Depth of the Parentheses

//https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/description/?envType=daily-question&envId=2024-04-04

// My Approach 1
func maxDepth(_ s: String) -> Int {
    var dict:[Character:Int] = [:]
    var count = 0
    for e in s {
        if e == "(" {
            count += 1
        } else if e == ")" {
            count -= 1
        }
        
        dict[e, default: 0] = max(count, dict[e, default: 0])
    }
    return dict.values.max() ?? 0
}

// Approach 2 (memory efficient as no need to maintain dict)
func maxDepth2(_ s: String) -> Int {
    var count = 0
    var maxcount = Int.min
    
    for ch in s {
        if ch == "("{
            count += 1
        }else if ch == ")" {
            count -= 1
        }
        maxcount = (count > maxcount) ? count : maxcount
    }
    return max(maxcount,count)
}

// Approach 3
func maxDepth3(_ s: String) -> Int {
    var output = 0
    var left = 0
    for item in s {
        if item == "(" {
            left += 1
        } else  if item == ")" {
            left -= 1
        }
        if output < left {
            output = left
        }
    }
    return output
}

print("Output", maxDepth("(1+(2*3)+((8)/4))+1"))
print("Output", maxDepth2("+(+(+)+)+"))
print("Output", maxDepth3("()"))
