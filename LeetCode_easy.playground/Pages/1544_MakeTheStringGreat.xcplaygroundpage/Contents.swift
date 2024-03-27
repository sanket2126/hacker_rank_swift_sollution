
// MARK: 1544. Make The String Great

//https://leetcode.com/problems/make-the-string-great/description/?envType=daily-question&envId=2024-04-04

// Approach 1
func makeGood(_ s: String) -> String {
    var result = ""
    for ch in s {
        if let last = result.last,
           let lastAscii = last.asciiValue,
           let current = ch.asciiValue,
           abs(Int(current) - Int(lastAscii)) == 32 {
            result.removeLast()
        } else {
            result.append(ch)
        }
    }
    return result
}

// Approach 2
extension Character {
    func isFlippedCaseOf(_ char: Character) -> Bool {
        self.lowercased() == char.lowercased() &&
        (self.isUppercase && char.isLowercase || self.isLowercase && char.isUppercase)
    }
}
func makeGood2(_ s: String) -> String {
    var letters: [Character] = []

    for char in s {
        if let lastLetter = letters.last, lastLetter.isFlippedCaseOf(char) {
            letters.popLast()
        } else {
            letters.append(char)
        }
    }

    return String(letters)
}

// Approach 3
func makeGood3(_ s: String) -> String {
    var stack = [Character]()
    
    for c in s {
        if let char = stack.last, char != c , char.lowercased() == c.lowercased() {
            stack.removeLast()
        }else{
            stack.append(c)
        }
    }
    return String(stack)
}

print("O/P 1", makeGood("abBAcC"))
print("O/P 2", makeGood2("LeEeetcode"))
print("O/P 3", makeGood2("LeEeetcode"))
