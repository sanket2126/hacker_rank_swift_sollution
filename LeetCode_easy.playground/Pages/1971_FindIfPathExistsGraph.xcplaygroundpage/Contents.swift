
// MARK: 1971. Find if Path Exists in Graph

//https://leetcode.com/problems/find-if-path-exists-in-graph/description/?envType=daily-question&envId=2024-04-21

class Solution {
    var path = [Int]()

    private func find(_ x: Int) -> Int {
        if (path[x] != x) {
            path[x] = find(path[x])
        }
        return path[x]
    }

    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        for i in 0..<n {
            path.append(i)
        }

        for e in edges {
            path[find(e[0])] = path[find(e[1])]
        }
        return find(source) == find(destination)
    }
}

var sol1 = Solution()
print("O/P", sol1.validPath(3, [[0,1],[1,2],[2,0]], 0, 2))

var sol2 = Solution()
print("O/P", sol2.validPath(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5))
