
// MARK: 678. Valid Parenthesis String

//https://leetcode.com/problems/valid-parenthesis-string/description/?envType=daily-question&envId=2024-04-07

import Foundation

// My Approach
func checkValidString(_ s: String) -> Bool {
    var count = 0

    for c in s {
        if c != ")" {
            count += 1
        } else if count > 0 {
            count -= 1
        } else {
            return false
        }
    }

    count = 0
    for c in s.reversed() {
        if c != "(" {
            count += 1
        } else if count > 0 {
            count -= 1
        } else {
            return false
        }
    }

    return true
}

// Time efficient approach
func checkValidString_2(_ s: String) -> Bool {
    let array = Array(s)
    var leftBracketStack = Array<Int>()
    var starStack = Array<Int>()
    
    for (i, c) in array.enumerated() {
        if c == "(" {
            leftBracketStack.insert(i, at: 0)
        } else if c == "*" {
            starStack.insert(i, at: 0)
        } else if c == ")" {
            if !leftBracketStack.isEmpty {
                leftBracketStack.removeFirst()
            } else if !starStack.isEmpty {
                starStack.removeFirst()
            } else {
                return false
            }
        }
    }
    while(!leftBracketStack.isEmpty && !starStack.isEmpty) {
        let left = leftBracketStack.removeFirst()
        let star = starStack.removeFirst()
        
        if left > star {
            return false
        }
    }
    return leftBracketStack.isEmpty
}

//Preffered Approach
func checkValidString_3(_ s: String) -> Bool {
    // lo => smallest possible amount of opening brackets
    // hi => largest possible amount of opening brackets
    var lo = 0, hi = 0

    for char in s {
        // If char is definitely an open bracket, increment lo
        if char == "(" { lo += 1 }
         // If it's a star or closing bracket, decrement
        else { lo -= 1 }

        // If char isn't a closed bracket, increment hi b/c it can be opening
        if char != ")" { hi += 1 }
        // It is a closing bracket, so decrement hi
        else { hi -= 1 }

        // If the highest amount of opening brackets we can have is negative, we can't ever have a valid string so return false
        if hi < 0 { return false }

        // If lo becomes negative, reset it to 0 since we can't have a negative amount of possible opening brackets (nothing stops the next character from being opening bracket)
        lo = max(lo, 0)
    }

    return lo == 0
}

print(checkValidString("((((()(()()()*()(((((*)()*(**(())))))(())()())(((())())())))))))(((((())*)))()))(()((*()*(*)))(*)()")) // true
print(checkValidString_2("(((((*)))**"))
print(checkValidString("(*))"))
print(checkValidString("((*)"))
print(checkValidString_3("(((((*(()((((*((**(((()()*)()()()*((((**)())*)*)))))))(())(()))())((*()()(((()((()*(())*(()**)()(())")) // false
