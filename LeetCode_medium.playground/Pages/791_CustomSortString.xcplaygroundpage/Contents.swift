
import Foundation

// MARK: 791. Custom Sort String

//https://leetcode.com/problems/custom-sort-string/

func customSortString(_ order: String, _ s: String) -> String {
    var map: [Character:Int] = [:]
    let array = Array(order)
    
    for i in 0..<array.count {
        map[array[i]] = i
    }
    
    let str = s.sorted { map[$0, default:0 ] < map[$1, default:0] }
    return String(str)
}


func customSortString2(_ order: String, _ s: String) -> String {
    var table: [Character: Int] = [:]
    var result = ""
    for ch in s {
        table[ch, default: 0] += 1
    }
    for ch in order {
        if let cnt = table[ch] {
            let temp = Array(repeating: ch, count: cnt)
            result += String(temp)
            table[ch] = nil
        }
    }
    for (k, v) in table {
        let temp = Array(repeating: k, count: v)
        result += String(temp)
    }
    return result
}

print(customSortString("cba","abcd"))

print(customSortString2("bcafg","abcd"))
