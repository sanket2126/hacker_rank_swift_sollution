//: [Previous](@previous)

import Foundation

// MARK: A pangram is a string that contains every letter of the alphabet. Given a sentence determine whether it is a pangram in the English alphabet. Ignore case. Return either pangram or not pangram as appropriate.
// The quick brown fox jumps over the lazy dog
// The string contains all letters in the English alphabet, so return pangram.



func pangrams(s: String) -> String {
    let strings = s.trimmingCharacters(in: .whitespacesAndNewlines)
    var counts: [String: Int] = [:]
    for item in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        counts[String(item)] = 0
    }
    for item in strings {
        counts[String(item.uppercased())] = (counts[String(item.uppercased())] ?? 0) + 1
    }
    let missing = counts.filter({ $0.value == 0 })
    
    return missing.isEmpty ? "pangram" : "not pangram"
}

/*
 Input
 We promptly judged antique ivory buckles for the next prize
 
 Output
 pangram
 
 */
