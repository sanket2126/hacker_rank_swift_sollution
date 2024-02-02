
/*
 
 Question:  Given a mountain array arr, return the index i such that arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].

 You must solve it in O(log(arr.length))time complexity.
  

 Example 1:
 Input: arr = [0,1,0]
 Output: 1

 Example 2:
 Input: arr = [0,2,1,0]
 Output: 1

 Example 3:
 Input: arr = [0,1,10,5,2]
 Output: 2
 
 */

func peekIndex(_ arr: [Int]) -> Int {
    guard arr.count > 1 else {
        return arr[0]
    }
    
    var l = 0, r = arr.count - 1
    while l <= r {
        let mid = (l + r) / 2
        if (mid > 0 && arr[mid - 1] < arr[mid]) && (mid < arr.count - 1 && arr[mid] > arr[mid + 1]) {
            return mid
        }
        else if (mid > 0 && mid < arr.count - 1 && arr[mid - 1] < arr[mid]) {
            l = mid + 1
        }
        else if (mid > 0 && mid < arr.count - 1 && arr[mid - 1] > arr[mid]) {
            r = mid - 1
        }
    }
    return -1
}
print(peekIndex([0,1,0]))
print(peekIndex([0,2,1,0]))
print(peekIndex([0,1,10,5,2]))
