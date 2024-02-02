// THIS one is not from Discord. it is from hacker rank.

func isPrime(num: Int) -> Bool{
    if(num == 1 || num == 0){
        return false
    }
    // For loop starts from 2 to num - 1
    for j in 2..<num {
        if(num % j == 0){
            return false
        }
    }
    return true
}

func getPrime(n: Int) -> [Int] {
    var primes = [Int]()
    var i = 2
    while primes.count < n {
        if isPrime(num: i) {
            primes.append(i)
        }
        i += 1
        // } else {
        //   break
    }
    return primes
}

//func waiter(number: [Int], q: Int) -> [Int] {
//    var answer = [Int]()
//    let primes = getPrime(n: q)
//    var numbers = number
//
//    for prime in primes {
//        var i = 0
//        while (i < numbers.count) {
//            if ((numbers[i] % prime) == 0) {
//                answer.append(numbers[i])
//                numbers.remove(at: i)
//                i -= 1
//            }
//            i += 1
//        }
//        numbers.reverse()
//    }
//    numbers.reverse()
//    answer.append(contentsOf: numbers)
//    print("Num and Ans", numbers, answer)
//    return answer
//}
// ABOVE one is solution but need to try another way in below option

func waiter(number: [Int], q: Int) -> [Int] {
    var answer = [Int]()
    let primes = getPrime(n: q)
    var numbers = number
//    TRY SAME WAY AS DID PREVIOUSLY.
    return answer
}
waiter(number: [3,4,7,6,5], q: 1)
