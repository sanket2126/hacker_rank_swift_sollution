
// MARK: 205. Isomorphic Strings

//https://leetcode.com/problems/isomorphic-strings/description/?envType=daily-question&envId=2024-04-02


func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count == t.count {
        let tt = Array(t)
        var dict: [Character:Character] = [:]
        var dictCounter: [Character:Int] = [:]
        for (i,e) in s.enumerated() {
            if let d = dict[e] , d != tt[i] {
                return false
            } else {
                dict[e] = tt[i]
            }
        }
        for (_,e) in dict {
            dictCounter[e, default: 0] += 1
            if dictCounter[e, default: 0] > 1 {
                return false
            }
        }
        return true
    } else {
        return false
    }
}

// 2nd Approach
func isIsomorphic2(_ s: String, _ t: String) -> Bool {
    var dict = [Character:Character]()
    for i in s.indices {
        if let value = dict[s[i]] {
            guard value == t[i] else {
                return false
            }
        } else if dict.values.contains(t[i]) {
           return false
        } else {
         dict[s[i]] = t[i]
        }
    }
    return true
}

// 3rd Approach
func isIsomorphic3(_ s: String, _ t: String) -> Bool {
    //if i see e, it maps to a
    // if i see g, it maps to d
    // go through the entire string, each characater must get replaced

    //store each letter in a dictionary and when you see it for the first time map it to the same index at t. if the letters don't match if it's already there, then return false
    var dict : [Character : Character] = [:]

    for (sLetter, tLetter) in zip(s, t) {
        if let char = dict[sLetter] {
            if char != tLetter { return false }
        }
        else {
            // if the value is already mapped to a key, check if that's the same as the tLetter
           if let keyForExistingVal = dict.first(where: { $0.value == tLetter })?.key {
                if keyForExistingVal != sLetter { return false }
           }
           // if it hasn't been seen before, set it to the tLetter
           else {
            dict[sLetter] = tLetter
           }
        }
    }
    return true
}

print(isIsomorphic("bbbaaaba", "aaabbbba"), isIsomorphic("foo", "bar"), isIsomorphic("egg", "add"))

print(isIsomorphic2("bbbaaaba", "aaabbbba"), isIsomorphic2("foo", "bar"), isIsomorphic2("egg", "add"))

print(isIsomorphic3("badc", "baba"), isIsomorphic3("paper", "title"))
