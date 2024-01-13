//: [Previous](@previous)

import Foundation

/*
 Louise and Richard have developed a numbers game. They pick a number and check to see if it is a power of . If it is, they divide it by . If not, they reduce it by the next lower number which is a power of . Whoever reduces the number to  wins the game. Louise always starts.

 Given an initial value, determine who wins the game.
 
 Example

 It's Louise's turn first. She determines that  is not a power of . The next lower power of  is , so she subtracts that from  and passes  to Richard.  is a power of , so Richard divides it by  and passes  to Louise. Likewise,  is a power so she divides it by  and reaches . She wins the game.

 Update If they initially set counter to , Richard wins. Louise cannot make a move so she loses.
 */

func numberOf2(_ n: Int) -> Int {
  var test = 2
  
  while test < n {
    test *= 2
  }
  
  if test == n {
    return n / 2
  } else {
    test /= 2
    return n - test
  }
}

func counterGame(n: Int) -> String {
  guard n > 1 else { return "Richard" }
  
  var isLouiseTurn = true
  var remainNumber = n
  
  while remainNumber > 1 {
    remainNumber = numberOf2(remainNumber)
    isLouiseTurn.toggle()
  }
  
  return !isLouiseTurn ? "Louise" : "Richard"
}
/*
 Input
 1
 6
 
 Output
 Richard
 
 As 6 is not a power of 2, Louise reduces the largest power of 2 less than 6 i.e.,4 , and hence the counter reduces to 2.
 As 2 is a power of 2, Richard reduces the counter by half of 2 i.e. 1. Hence the counter reduces to 1.
 As we reach the terminating condition with N == 1, Richard wins the game.
 */
