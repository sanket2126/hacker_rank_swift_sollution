
import Foundation

// MARK: 1700. Number of Students Unable to Eat Lunch

//https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/?envType=daily-question&envId=2024-04-08

func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var st = students
    var j = 0
    
    while (j < sandwiches.count) {
        if st[0] == sandwiches[j] {
            j += 1
            st.remove(at: 0)
        } else {
            if !st.contains(sandwiches[j]) {
                return st.count
            } else {
                st.append(st.remove(at: 0))
            }
        }
    }
    return st.count
}

// Approach 2
func countStudents2(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var studentsNew = students
    var sandwichesNew = sandwiches
    while !sandwichesNew.isEmpty && studentsNew.contains( sandwichesNew.first ?? 7) {
        if sandwichesNew[0] == studentsNew[0] {
            sandwichesNew.remove(at: 0)
            studentsNew.remove(at: 0)
        } else {
            let first = studentsNew.removeFirst()
            studentsNew.append(first)
        }
    }

    return sandwichesNew.count
}

// Approach 3
//class Solution {
//    var sandwichesStack: [Int] = []
//
//    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
//        var students = students
//
//        for s in sandwiches.reversed() {
//            sandwichesStack.append(s)
//        }
//
//        var isExhausted: Bool = false
//
//        while(!isExhausted) {
//            isExhausted = true
//
//            for i in 0..<students.count {
//                if students[i] != -1 {
//                    if students[i] == sandwichesStack.last {
//                        students[i] = -1
//                        sandwichesStack.removeLast()
//                        isExhausted = false
//                    }
//                }
//            }
//
//            if sandwichesStack.count == 0 {
//                isExhausted = true
//            }
//        }
//
//        return sandwichesStack.count
//    }
//}

print("O/P ",countStudents([1,1,0,0], [0,1,0,1]))
print("O/P ",countStudents2([1,1,0,1], [0,1,0,1]))
print("O/P ",countStudents([1,0,0,0], [0,1,0,1]))
print("O/P ",countStudents([0,0,0,0], [1,1,1,1]))
print("O/P ",countStudents([1,1,1,0,0,1], [1,0,0,0,1,1]))
