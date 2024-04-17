
// MARK: 950. Reveal Cards In Increasing Order

//https://leetcode.com/problems/reveal-cards-in-increasing-order/description/?envType=daily-question&envId=2024-04-10

import Foundation

// My Approach
func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    var dq = [Int]()
    let dec = deck.sorted()
    var answer = [Int]()
    
    for i in stride(from: dec.count-1, to: -1, by: -1) {
        if !(dq.isEmpty) {
            dq.insert(dq.removeLast(), at: 0)
        }
        dq.insert(dec[i], at: 0)
    }
    
    for _ in stride(from: dec.count-1, to: -1, by: -1) {
        answer.insert(dq.removeLast(), at: 0)
    }
    
    return answer
}

// Approach 2
//import Collections  // required to import to use Deque<Int>
//func deckRevealedIncreasing_2(_ deck: [Int]) -> [Int] {
//
//    Array(deck.sorted().reversed().reduce(into: Deque<Int>()) { deque, card in
//        if let lastCard = deque.popLast() { deque.prepend(lastCard) }
//        deque.prepend(card)
//    })
//}

// Approach 3
func deckRevealedIncreasing_3(_ deck: [Int]) -> [Int] {
    
    var ds = deck.sorted(by: >)
    var res = [ds.removeFirst()]
    
    while !ds.isEmpty {
        res.insert(res.removeLast(), at: 0)
        res.insert(ds.removeFirst(), at: 0)
    }
    
    return res
}

print("O/P :- ", deckRevealedIncreasing([17,13,11,2,3,5,7]))
print("O/P :- ", deckRevealedIncreasing_3([17,13,11,2,3,5,7]))

print("O/P :- ", deckRevealedIncreasing([1,1000]))
print("O/P :- ", deckRevealedIncreasing_3([1,1000]))
