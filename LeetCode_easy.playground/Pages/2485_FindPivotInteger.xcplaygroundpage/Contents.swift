
import Foundation

// MARK: 2485. Find the Pivot Integer

//https://leetcode.com/problems/find-the-pivot-integer/?envType=daily-question&envId=2024-03-13

// Approach 1
func pivotInteger(_ n: Int) -> Int {
    var i = 1
    var j = n
    var sumI = 0
    var sumJ = 0
    if (n == 1) {
        return 1
    }
    while (i != j) {
        if sumI < sumJ {
            sumI += i
            i += 1
        } else {
            sumJ += j
            j -= 1
        }
    }
    if (sumI == sumJ) {
        return i
    }
    return -1
}

// Approach 2
func pivotInteger2(_ n: Int) -> Int {
    let totalSum = (n * (n+1)) / 2
    for pivot in stride(from: n, through: 1, by: -1) {
      let pivotSum = (pivot * (pivot+1))/2
      if pivotSum == totalSum - pivotSum + pivot {
        return pivot
      }
    }
    return -1
  }


print(pivotInteger(8))
print(pivotInteger(1))
print(pivotInteger(4))

print(pivotInteger2(8))
