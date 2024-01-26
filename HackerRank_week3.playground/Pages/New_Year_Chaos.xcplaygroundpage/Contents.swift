import UIKit
/*
 It is New Year's Day and people are in line for the Wonderland rollercoaster ride. Each person wears a sticker indicating their initial position in the queue from  to . Any person can bribe the person directly in front of them to swap positions, but they still wear their original sticker. One person can bribe at most two others.

 Determine the minimum number of bribes that took place to get to a given queue order. Print the number of bribes, or, if anyone has bribed more than two people, print Too chaotic.
 
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
 
 some details and input output pending
 
 Output
 
 */
