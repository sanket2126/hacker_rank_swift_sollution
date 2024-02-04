
// MARK: Bomberman lives in a rectangular grid. Each cell in the grid either contains a bomb or nothing at all.
/*
 Each bomb can be planted in any cell of the grid but once planted, it will detonate after exactly 3 seconds. Once a bomb detonates, it's destroyed — along with anything in its four neighboring cells. This means that if a bomb detonates in cell i,j any valid cells (i +/- 1, j) and (i, j +/- 1) are cleared.
 
 If there is a bomb in a neighboring cell, the neighboring bomb is destroyed without detonating, so there's no chain reaction.

 Bomberman is immune to bombs, so he can move freely throughout the grid. Here's what he does:

 1) Initially, Bomberman arbitrarily plants bombs in some of the cells, the initial state.
 2) After one second, Bomberman does nothing.
 3) After one more second, Bomberman plants bombs in all cells without bombs, thus filling the whole grid with bombs. No bombs detonate at this point.
 4) After one more second, any bombs planted exactly three seconds ago will detonate. Here, Bomberman stands back and observes.
 5) Bomberman then repeats steps 3 and 4 indefinitely.

 */


func plantRemainingBomb(grid: [[Int]]) -> [[Int]] {
    return grid.map({ $0.map({ $0 == 0 ? 3 : $0-1})})
}

func detonateBomb(grid: [[Int]]) -> [[Int]] {
  var detonate = grid.map({ $0.map({ $0 > 0 ? $0-1 : $0})})
  
  for (i,r) in grid.enumerated() {
    for (j,_) in r.enumerated() {
      if grid[i][j] == 1 {
        if i > 0 {
          detonate[i-1][j] = 0
        }
        if i < grid.count - 1 {
          detonate[i+1][j] = 0
        }
        if j > 0 {
          detonate[i][j-1] = 0
        }
        if j < r.count - 1 {
          detonate[i][j+1] = 0
        }
      }
      }
    }
  return detonate
}

func bomberMan(n: Int, grid: [String]) -> [String] {
    // Write your code here
    var result = grid.map({ Array($0) }).map({ $0.map({ $0 == "O" ? 3 : 0}) })
    var range = n
    if (n >= 200) {
      range = ((n-1) % 4)+5;
    }
    for i in stride(from: 1, through: range, by: 1) {
      if (i % 2) == 1 {
        result = detonateBomb(grid: result)
      } else {
        result = plantRemainingBomb(grid: result)
      }
    }
    print(result.map({ $0.map({ $0 > 0 ? "O" : "."}) }))
    return result.map({ String($0.map({ $0 > 0 ? "O" : "."})) })
}

/*
 Input
 .......
 ...O...
 ....O..
 .......
 OO.....
 OO.....

 Output (After 3 Sec)
 OOO.OOO
 OO...OO
 OOO...O
 ..OO.OO
 ...OOOO
 ...OOOO
 
 */
