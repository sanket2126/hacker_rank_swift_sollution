//: [Previous](@previous)

import Foundation

//MARK: There is a collection of input strings and a collection of query strings. For each query string, determine how many times it occurs in the list of input strings. Return an array of the results.

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var counts: [String: Int] = [:]

    for item in strings {
        counts[item] = (counts[item] ?? 0) + 1
    }
    var c: [Int] = []
    for q in queries {
        c.append(counts[q] ?? 0)
    }
    return c
}

/*
 INPUT
 4
 [aba,baba,aba,xzxb]
 
 3
 [aba,xzxb,ab]
 
 OUTPUT
 2
 1
 0
 
 */
