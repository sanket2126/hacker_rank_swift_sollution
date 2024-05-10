// MARK: 200. Number of Islands

//https://leetcode.com/problems/number-of-islands/description/?envType=daily-question&envId=2024-04-19

class Solution {
    var arr : [[Character]] = []
    var m = 0
    var n = 0

    func dfs(_ i: Int,_ j: Int) {
        if i >= 0 && i <= m - 1 && j >= 0 && j <= n - 1 {
            if arr[i][j] == "1" {
                arr[i][j] = "0"
                dfs(i+1,j)
                dfs(i,j+1)
                dfs(i-1,j)
                dfs(i,j-1)
            }
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        self.arr = grid
        var count = 0
        m = arr.count
        n = arr[0].count
        for i in 0...m - 1 {
            for j in 0...n - 1 {
                if arr[i][j] == "1" {
                    count += 1
                    dfs(i,j)
                }
            }
        }
        return count
    }
}

let sol = Solution()
print("O/P ", sol.numIslands([ ["1","1","1","1","0"],
                               ["1","1","0","1","0"],
                               ["1","1","0","0","0"],
                               ["0","0","0","0","0"]
                             ]))

print("O/P ", sol.numIslands([ ["1","1","0","0","0"],
                               ["1","1","0","0","0"],
                               ["0","0","1","0","0"],
                               ["0","0","0","1","1"]]))
