
// MARK: 79. Word Search

//https://leetcode.com/problems/word-search/description/?envType=daily-question&envId=2024-04-03

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    let rows = board.count
    let cols = board[0].count
    let word = Array(word)
    var isVisited : [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
    
    for i in 0..<rows {
        for j in 0..<cols {
            if (board[i][j] == word[0]) && (dfs(board, i, j, 0, &isVisited , word)){
                return true
            }
        }
    }
    return false
}

func dfs(_ board: [[Character]],_ i:Int,_ j: Int,_ idx: Int,_ isVisited: inout [[Bool]],_ word:[Character]) -> Bool {
    if idx == word.count-1 {
        return true
    }
    
    isVisited[i][j]=true
    let r = board.count
    let c = board[0].count
    
    if( i-1>=0 && !isVisited[i-1][j] && board[i-1][j]==word[idx+1] && dfs(board, i-1, j, idx+1, &isVisited, word)) {
        return true
    }
    if( i+1<=r-1 && !isVisited[i+1][j] && board[i+1][j]==word[idx+1] && dfs(board, i+1, j, idx+1, &isVisited, word)) {
        return true
    }
    if( j-1>=0 && !isVisited[i][j-1] && board[i][j-1]==word[idx+1] && dfs(board, i, j-1, idx+1, &isVisited, word)) {
        return true
    }
    if( j+1<=c-1 && !isVisited[i][j+1] && board[i][j+1]==word[idx+1] && dfs(board, i, j+1, idx+1, &isVisited, word) ){
        return true
    }
    isVisited[i][j]=false
    return false
}

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))
