
// MARK: 452. Minimum Number of Arrows to Burst Balloons

//https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/?envType=daily-question&envId=2024-03-18

import Foundation

func findMinArrowShots(_ points: [[Int]]) -> Int {
    guard !points.isEmpty else { return 0 }
    guard points.count > 1 else { return 1 }
    
    var sortedArr = points.sorted { $0[1] < $1[1] }
    var end = sortedArr[0][1]
    var arrow = 1
    
    for i in sortedArr {
        if i[0] <= end {
            continue
        } else {
            end = i[1]
            arrow += 1
        }
    }
    
    return arrow
}

// Similar approach
func findMinArrowShots_2(_ points: [[Int]]) -> Int {
    var sortedArr = points.sorted { $0[1] < $1[1] }
    var arrow = 1
    var end = sortedArr[0][1]
    for i in sortedArr {
        if i[0] <= end {
            continue
        } else {
            end = i[1]
            arrow += 1
        }
    }
    return arrow
}

print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
print(findMinArrowShots_2([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]]))
