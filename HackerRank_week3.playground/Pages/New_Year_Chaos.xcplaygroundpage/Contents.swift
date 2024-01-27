import UIKit

// MARK: It is New Year's Day and people are in line for the Wonderland rollercoaster ride. Each person wears a sticker indicating their initial position in the queue from  to . Any person can bribe the person directly in front of them to swap positions, but they still wear their original sticker. One person can bribe at most two others.

// MARK: Determine the minimum number of bribes that took place to get to a given queue order. Print the number of bribes, or, if anyone has bribed more than two people, print Too chaotic.
 /*
  q = [1,2,3,5,4,6,7,8]
  If person 5 bribes person 4, the queue will look like this: 1,2,3,5,4,6,7,8. Only 1 bribe is required. Print 1.

  q = [4,1,2,3]
  Person 4 had to bribe 3 people to get to the current position.
  Print Too chaotic.
  
 */

func minimumBribes(q: [Int]) -> Void {
    // Write your code here
    var bribe = 0
    for (i,e) in q.enumerated() {
      if ((e - 2) > (i + 1)) {
        print("Too chaotic")
        return
      } else {
        var j = (i-1)
        while ((j >= e-2) && (j >= 0)) {
          if q[j] > e {
            // print(i,j, e, q[j])
            bribe += 1 }
          j -= 1
        }
      }
    }
    print(bribe)
}

minimumBribes(q: [2,5,1,3,4])

/*
 Input
 2 1 5 3 4   q = [2, 1, 5, 3, 4]
 Output
 3
 
 Input
 2 5 1 3 4   q = [2, 5, 1, 3, 4]
 Output
 Too Chaotic
 */
