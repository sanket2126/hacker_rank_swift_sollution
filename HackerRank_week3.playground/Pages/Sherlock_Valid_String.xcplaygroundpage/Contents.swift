// MARK: Sherlock considers a string to be valid if all characters of the string appear the same number of times. It is also valid if he can remove just 1 character at 1 index in the string, and the remaining characters will occur the same number of times. Given a string S, determine if it is valid. If so, return YES, otherwise return NO.
 
/*
 String S = "abc"
 This is a valid string because frequencies are .{a:1, b:1, c:1}
 
 String S = "abcc"
 This is a valid string because we can remove one c and have 1 of each character in the remaining string.
 */

func isValid(s: String) -> String {
  var dictCount = [String: Int]()
  var valCount = [Int: Int]()
  for e in s {
    dictCount["\(e)"] = (dictCount["\(e)"] ?? 0) + 1
  }
  for e in dictCount.values {
    valCount[e] = (valCount[e] ?? 0) + 1
  }
  if valCount.count == 1 {
    return "YES"
  } else if (valCount.count == 2) {
    let k1 = valCount.keys.min() ?? 0
    let k2 = valCount.keys.max() ?? 0
    if (valCount[k1] == 1 && k1 == 1) || (valCount[k2] == 1 && k2 == 1) {
      return "YES"
    }
    if (abs(k1 - k2) == 1) && (valCount[k1] == 1 || valCount[k2] == 1) {
     return "YES"
    }
  }
  return "NO"
}

print(isValid(s: "aabbcd"))

print(isValid(s: "abcdefghhgfedecba"))

/*
 Example
 String S = aabbcd
 
 2 is the minimum number of removals required to make it a valid string. It can be done in following two ways:

 Remove c and d to get aabb.
 Or remove a and b to get abcd.
 
 */
