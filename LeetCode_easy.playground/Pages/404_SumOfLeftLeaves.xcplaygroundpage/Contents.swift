
// MARK: 404. Sum of Left Leaves

//https://leetcode.com/problems/sum-of-left-leaves/description/?envType=daily-question&envId=2024-04-14

import Foundation

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

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var queue: [TreeNode?] = [root]
    var sum = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if let left = node?.left {
            if left.left == nil && left.right == nil {
                sum += left.val
            } else {
                queue.append(left)
            }
        }
        
        if let right = node?.right {
            queue.append(right)
        }
    }
    
    return sum
}

let tree1 = TreeNode(1)
let tree2 = TreeNode(3, TreeNode(9, nil, nil), TreeNode(20, TreeNode(15), TreeNode(7)))
let tree3 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))

print("Result -",sumOfLeftLeaves(tree1))
print("Result -",sumOfLeftLeaves(tree2))
print("Result -",sumOfLeftLeaves(tree3))
