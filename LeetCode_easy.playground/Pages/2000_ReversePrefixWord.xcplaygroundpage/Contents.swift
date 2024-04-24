
// MARK: 2000. Reverse Prefix of Word

//https://leetcode.com/problems/reverse-prefix-of-word/description/?envType=daily-question&envId=2024-05-01

func reversePrefix(_ word: String, _ ch: Character) -> String {
    if let index = word.firstIndex(of: ch) {
        return String(word[word.startIndex...index].reversed()) + word[word.index(after: index)..<word.endIndex]
    }
    return word
}

print("O/P", reversePrefix("abcdefd","d"))

print("O/P", reversePrefix("xyxzxe","z"))

print("O/P", reversePrefix("abcd","z"))
