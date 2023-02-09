//: [Previous](@previous)

import Foundation

// MARK: Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.
//Lily decides to share a contiguous segment of the bar selected such that:
//The length of the segment matches Ron's birth month, and,
//The sum of the integers on the squares is equal to his birth day.
//Determine how many ways she can divide the chocolate.

extension Collection {
    var powerSet: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(dropFirst()).powerSet.flatMap { [$0, [self.first!] + $0]}
    }
}

func birthday(s: [Int], d: Int, m: Int) -> Int {
    if s.count <= 3 {
        let fil = Set(s.powerSet).filter({ $0.count == m })
        let final = fil.filter({ ($0.reduce(0, +) == d) })
        return final.count
    } else {
        var mainArray = [[Int]]()
        for i in 0...(s.count - m)  {
            var subArray = [s[i]]
            var sum = s[i]
            for p in (i+1)..<s.count {
                sum += s[p]
                if sum < d {
                    subArray.append(s[p])
                } else if sum == d {
                    subArray.append(s[p])
                }
            }
            if subArray.count == m && (subArray.reduce(0, +) == d) {
                mainArray.append(subArray)
            }
        }
        return mainArray.count
    }
}
