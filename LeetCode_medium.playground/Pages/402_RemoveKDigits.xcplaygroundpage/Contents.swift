
//MARK: 402. Remove K Digits

//https://leetcode.com/problems/remove-k-digits/description/?envType=daily-question&envId=2024-04-11

import Foundation

func removeKdigits(_ num: String, _ k: Int) -> String {
    if num.count <= k { return "0" }

    var str = Array(num)
    var count = 0, i = 0
    while (i < str.count-1) && (k != count) {
        let val1 = (Int("\(str[i])") ?? 0)
        let val2 = (Int("\(str[i+1])") ?? 0)
        if val1 != val2 {
            if val1 > val2 {
                str.remove(at: i)
            } else {
                str.remove(at: i+1)
            }
            count += 1
            i -= 1
        }
        i += 1
    }
    if num.count == str.count {
        str.removeLast(k)
    }
    return "\(Int(String(str)) ?? 0)"
}


func removeKdigits_2(_ num: String, _ k: Int) -> String {
        var count = k
        if num.count <= count {
            return "0"
        }
        var stack: [Character] = []
        for n in num {
            while let temp = stack.last, temp > n, count > 0 {
                count -= 1
                stack.removeLast()
            }
            stack.append(n)
        }
        while count > 0 {
            stack.removeLast()
            count -= 1
        }

        while stack.first == "0" {
            stack.removeFirst()
        }
        return stack.isEmpty ? "0" : String(stack)
    }

print("O/P",removeKdigits("1432219", 3))
print("O/P",removeKdigits("10200", 1))
print("O/P",removeKdigits("10", 1))
print("O/P",removeKdigits("112", 1))
print("O/P",removeKdigits_2("1173", 2))
print("O/P",removeKdigits_2("12345", 2))
print("O/P",removeKdigits("1111111", 3))
