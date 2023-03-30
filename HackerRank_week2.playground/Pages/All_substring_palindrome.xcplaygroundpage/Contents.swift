
import Foundation

/*

 Find all non-single letter substrings that are palindromes. The string given is "aabbbaa".
 Leet code solution asked in Discord channel
 */

func isPrime(num: Int) -> Bool {
   if(num == 1 || num == 0){
      return false
   }
   // For loop starts from 2 to num - 1
   for j in 2..<num{
      if(num % j == 0){
         return false
      }
   }
   return true
}

var primes = [Int]()
(2...10).forEach({
    if isPrime(num: $0) {
        primes.append($0)
    }
})
print(primes)
