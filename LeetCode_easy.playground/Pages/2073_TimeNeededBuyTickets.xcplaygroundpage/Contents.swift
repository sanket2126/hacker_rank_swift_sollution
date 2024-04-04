
import Foundation

// MARK: 2073. Time Needed to Buy Tickets

//https://leetcode.com/problems/time-needed-to-buy-tickets/description/?envType=daily-question&envId=2024-04-09

func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
    var time = 0
    for (i,t) in tickets.enumerated() {
        if t >= tickets[k] {
            if i > k {
                time += tickets[k] - 1
            } else {
                time += tickets[k]
            }
        } else {
            time += t
        }
    }
    return time
}

// Appraoch 2
func timeRequiredToBuy2(_ tickets: [Int], _ k: Int) -> Int {
    var count = 0
    for i in 0 ..< tickets.count {
        count += min(tickets[i], i > k ? tickets[k] - 1 : tickets[k])
    }
    return count
}

print(timeRequiredToBuy([2,3,2], 2))

print(timeRequiredToBuy2([5,1,1,1], 0))

print(timeRequiredToBuy2([84,49,5,24,70,77,87,8], 3))

print(timeRequiredToBuy([15,66,3,47,71,27,54,43,97,34,94,33,54,26,15,52,20,71,88,42,50,6,66,88,36,99,27,82,7,72], 18))
