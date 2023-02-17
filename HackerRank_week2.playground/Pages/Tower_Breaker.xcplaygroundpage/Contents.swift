
import Foundation

/*
 There are 2 towers, each 6 units tall. Player 1 has a choice of two moves:
 - remove 3 pieces from a tower to leave 3 as 6 % 3 = 0
 - remove 5 pieces to leave 1
 
 Let Player 1 remove 3. Now the towers are 3 and 6 units tall.
 Player 2 matches the move. Now the towers are both 3 units tall.
 Now Player 1 has only one move.
 
 Player 1 removes 2 pieces leaving 1. Towers are 1 and 2 units tall.
 Player 2 matches again. Towers are both 1 unit tall.
 Player 1 has no move and loses. Return 2.
 */

func towerBreakers(n: Int, m: Int) -> Int {
    if m == 1{
        return 2
    } else if (n % 2 == 0) && (m != 1) {
        return 2
    }
    return 1
}

/*
 Input
 2 2     n = 2, m = 2
 1 4     n = 1, m = 4
 
 Output
 2
 1
 
 */
