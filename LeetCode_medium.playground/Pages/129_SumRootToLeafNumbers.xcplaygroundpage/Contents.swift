
//MARK: 129. Sum Root to Leaf Numbers

//https://leetcode.com/problems/sum-root-to-leaf-numbers/description/?envType=daily-question&envId=2024-04-15

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

class Solution {
    var sum = 0
    var valueToAdd = 0

    func sumNumbers(_ root: TreeNode?) -> Int {
        sum = 0
        valueToAdd = 0 // just for running demo here
        guard let root = root else {
            return 0
        }
        valueToAdd = (valueToAdd * 10) + root.val
        generateNodeNum(root)
        return sum
    }

    func generateNodeNum(_ node: TreeNode?) {
        if node?.left == nil && node?.right == nil {
            sum += valueToAdd
            valueToAdd -= (node?.val ?? 0)
        }
    
        if let left = node?.left {
            valueToAdd = (valueToAdd * 10) + left.val
            generateNodeNum(left)
            valueToAdd /= 10
        }
        if let right = node?.right {
            valueToAdd = (valueToAdd * 10) + right.val
            generateNodeNum(right)
            valueToAdd /= 10
        }
    }
}

let tree1 = TreeNode(1, nil, TreeNode(3))
let tree2 = TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))
let tree3 = TreeNode(6, TreeNode(4, TreeNode(6, nil, TreeNode(4, TreeNode(2, TreeNode(6), nil), nil)), nil), TreeNode(1))

let sol = Solution()
print("Result -", sol.sumNumbers(tree1))
print("Result -", sol.sumNumbers(tree2))
print("Result -", sol.sumNumbers(tree3))
