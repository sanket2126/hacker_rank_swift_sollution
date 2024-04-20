
// MARK: 463. Island Perimeter

//https://leetcode.com/problems/island-perimeter/description/?envType=daily-question&envId=2024-04-18

import Foundation

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var perimeter = 0
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == 1 {
                perimeter += 4
                if i > 0 && grid[i - 1][j] == 1 {
                    perimeter -= 2
                }
                if j > 0 && grid[i][j - 1] == 1 {
                    perimeter -= 2
                }
            }
        }
    }
    return perimeter
}

func islandPerimeter_2(_ grid: [[Int]]) -> Int {
    var island: Int = 0
    var neighbor: Int = 0
    
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 0 { continue }
            island += 1
            if i < grid.count - 1 && grid[i+1][j] == 1 { neighbor += 1 }
            if j < grid[i].count - 1 && grid[i][j+1] == 1 { neighbor += 1 }
        }
    }
    
    return island*4 - neighbor*2
}

print("O/P : ",islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))
print("O/P : ",islandPerimeter_2([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))

print("O/P : ",islandPerimeter([[1]]))
print("O/P : ",islandPerimeter_2([[1]]))

print("O/P : ",islandPerimeter([[1,0]]))
print("O/P : ",islandPerimeter_2([[1,0]]))
