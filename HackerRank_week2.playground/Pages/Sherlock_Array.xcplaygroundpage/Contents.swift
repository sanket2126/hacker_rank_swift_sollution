//: [Previous](@previous)

// MARK: Watson gives Sherlock an array of integers. His challenge is to find an element of the array such that the sum of all elements to the left is equal to the sum of all elements to the right.
/*
arr = [5,6,8,11]
8 is between two subarrays that sum to 11.

arr = [1]
 
The answer is [1] since left and right sum to 0.

You will be given arrays of integers and must determine whether there is an element that meets the criterion. If there is, return YES. Otherwise, return NO.
 */

func balancedSums(arr: [Int]) -> String {
    // Write your code here
    var i = 0, j = arr.count - 1
    var low = arr.first ?? 0
    var high = arr.last ?? 0
    
    while (i < j) {
      if low < high {
        i += 1
        low += arr[i]
      } else {
        j -= 1
        high += arr[j]
      }
    }
    
    return (low == high) ? "YES" : "NO"
}

print(balancedSums(arr: [5,6,8,11]))
