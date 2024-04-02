
// MARK: 58. Length of Last Word

//https://leetcode.com/problems/length-of-last-word/description/?envType=daily-question&envId=2024-04-01

import Foundation

// Approach 1
func lengthOfLastWord(_ s: String) -> Int {
    return s.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ").last?.count ?? 0
}

// Approach 2
func lengthOfLastWord2(_ s: String) -> Int {
    var length = 0
    
    for char in s.reversed() {
        if char == " " {
            if length > 0 { break }
        } else {
            length += 1
        }
    }
    
    return length
}

//Approach 3
func lengthOfLastWord3(_ s: String) -> Int {
    let wordArr = s.split(separator: " ")
    return wordArr.last?.count ?? 0
}

print(lengthOfLastWord("Hello World  "))
print(lengthOfLastWord2("Hello World  "))
print(lengthOfLastWord3("Hello World  "))
