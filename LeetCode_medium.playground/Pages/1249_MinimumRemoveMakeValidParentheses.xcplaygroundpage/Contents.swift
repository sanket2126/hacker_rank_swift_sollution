
//MARK: 1249. Minimum Remove to Make Valid Parentheses

//https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/description/?envType=daily-question&envId=2024-04-06

import Foundation

func minRemoveToMakeValid(_ s: String) -> String {
    var stack = [Character]()
    var lastOpenCount = 0
    
    for c in s {
        if c == "(" {
            lastOpenCount += 1
            stack.append(c)
        } else if c == ")" && lastOpenCount > 0 {
            stack.append(c)
            lastOpenCount -= 1
        } else if c != ")" {
            stack.append(c)
        }
    }
    while lastOpenCount != 0 {
        if let indx = stack.lastIndex(of: "(") {
            stack.remove(at: indx)
            lastOpenCount -= 1
        }
    }
    return String(stack)
}


// 2nd Approach
func minRemoveToMakeValid_2(_ s: String) -> String {
    // Count the number of unused right parentheses.
    var unusedRight = s.reduce(0) { $0 + ($1 == ")" ? 1 : 0) }
    // Track the balance of open and closing parentheses.
    var balance = 0
    return s.filter {
        if $0 == "(" {
            if unusedRight == 0 {
                // This open parenthesis can't be closed.
                return false
            }
            balance += 1
            unusedRight -= 1
        } else if $0 == ")" {
            if balance == 0 {
                // There's no open parenthesis to close.
                unusedRight -= 1
                return false
            }
            balance -= 1
        }
        return true
    }
}

print(minRemoveToMakeValid("lee(t(c)o)de)"))
print(minRemoveToMakeValid("(a(b(c)d)"))
print(minRemoveToMakeValid("))(("))
print(minRemoveToMakeValid_2("a)b(c)d"))
print(minRemoveToMakeValid_2("())()((("))
