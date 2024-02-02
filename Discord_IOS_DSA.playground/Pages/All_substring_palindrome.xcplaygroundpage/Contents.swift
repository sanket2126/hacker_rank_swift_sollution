
// MARK: - wrong output need to work on it

/*

 Find all non-single letter substrings that are palindromes. The string given is "aabbbaaa".
 Leet code solution asked in Discord channel
 */

var original = "aabbaaa"
var copy = original
var count = original.count
var arr = [original]

print(original.split(separator: "",maxSplits: (count*count-1)/2))

for _ in 0...count-1 {
    original = "\(original.dropFirst())"
    copy = "\(copy.dropLast())"
    if original.count > 1 {
        arr.append(original)
    }
    if copy.count > 1 {
        arr.append(copy)
    }
}

var palindrome = arr.filter({ ($0 == String($0.reversed())) })
print(palindrome)
