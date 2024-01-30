
// MARK: An arcade game player wants to climb to the top of the leaderboard and track their ranking. The game uses Dense Ranking, so its leaderboard works like this:

// MARK: The player with the highest score is ranked number 1 on the leaderboard. Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.
 
/*
 Ranked = [100, 90, 90, 80]
 Player = [70, 80, 105]
 
 The ranked players will have ranks 1, 2, 2, and 3, respectively. If the player's scores are 70, 80 and 105, their rankings after each game are 4, 3 and 1. Return [4,3,1].
 */

func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    var rank = 1
    var ranking = [Int]()
    // Loop for ranking array as per the scores
    for (i,e) in ranked.enumerated() {
      if i > 0 {
        if e == ranked[i-1] {
         ranking.append(rank)
        } else {
          rank += 1
          ranking.append(rank)
        }
      } else {
        ranking.append(rank)
      }
    }
    
    // Actual calculation of rank for the players
    var result = [Int]()
    var playerPoint = player.count - 1
    rank = 0
    while (playerPoint >= 0){
        if rank >= ranked.count {
            result.append((ranking.last ?? result.last ?? 0) + 1)
            playerPoint -= 1
        } else {
            if player[playerPoint] >= ranked[rank] {
                result.append(ranking[rank])
                playerPoint -= 1
            } else {
                rank += 1
            }
        }
    }
    return result.reversed()
}

print(climbingLeaderboard(ranked: [100, 100, 50, 40, 40, 20, 10], player: [5, 25, 50, 120]))
/*
 
 Input
 7
 100 100 50 40 40 20 10
 4
 5 25 50 120

 Output
 6
 4
 2
 1
 
 */
