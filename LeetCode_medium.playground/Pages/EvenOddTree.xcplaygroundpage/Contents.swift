// MARK: 1609. Even Odd Tree

//https://leetcode.com/problems/even-odd-tree/description/?envType=daily-question&envId=2024-02-29


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
//MARK: BFS Approach 1
func isEvenOddTree(_ root: TreeNode?) -> Bool {
    var even : Bool = true
    var q  : [TreeNode?] = [root]
    while !q.isEmpty {
        var prev = even ? Int.min : Int.max
        for _ in 0..<q.count  {
            let node = q.removeFirst()!
            if ( (even) && (node.val % 2 == 0 || node.val <= prev) ){
                return false
            }
            else if ( (!even) && (node.val % 2 == 1 || node.val >= prev) ){
                return false
            }
            prev = node.val
            
            if node.left != nil {
                q.append(node.left)
            }
            if node.right != nil {
                q.append(node.right)
            }
        }
        even = !(even)
    }
    return true
}

//MARK: DFS Approach 2
func isEvenOddTreeDFS(_ root: TreeNode?) -> Bool {
        var frontier = [(0, root!)]
        var levels: [Int: [Int]] = [:]
        while let (d, node) = frontier.popLast() {
            guard d % 2 != node.val % 2 else { return false }
            if let prev = levels[d]?.last {
                if d % 2 == 0 {
                    guard prev < node.val else { return false }
                } else {
                    guard prev > node.val else { return false }
                }
            }
            levels[d, default: []].append(node.val)
            if let rchild = node.right {
                frontier.append((d+1, rchild))
            }
            if let lchild = node.left {
                frontier.append((d+1, lchild))
            }
        }
        return true
    }


let tree1 = TreeNode(1,
                     TreeNode(10,
                              TreeNode(3, TreeNode(12), TreeNode(8)),
                              nil),
                     TreeNode(4,
                              TreeNode(7, TreeNode(6), nil),
                              TreeNode(9, nil, TreeNode(2))
                             ))
//[1,10,4,3,null,7,9,12,8,6,null,null,2]
print("Result ",isEvenOddTree(tree1))

let tree2 = TreeNode(5, TreeNode(4, TreeNode(3), TreeNode(3)), TreeNode(2, TreeNode(7), nil) )
//[5,4,2,3,3,7]
print("Result ",isEvenOddTreeDFS(tree2))

let tree3 = TreeNode(5, TreeNode(9, TreeNode(3), TreeNode(5)), TreeNode(1, TreeNode(7), nil) )
//[5,9,1,3,5,7]
print("Result ",isEvenOddTree(tree3))
