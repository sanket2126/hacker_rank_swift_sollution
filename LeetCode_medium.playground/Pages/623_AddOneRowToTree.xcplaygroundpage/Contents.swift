
// MARK: 623. Add One Row to Tree

//https://leetcode.com/problems/add-one-row-to-tree/description/?envType=daily-question&envId=2024-04-16

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

// My Approach
func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    if depth == 1 {
        var currNode = root
        var newNode = TreeNode(val)
        newNode.left = currNode
        return newNode
    }
    dfs(root, val, depth, 1)
    return root
}

func dfs(_ node: TreeNode?,_ val: Int,_ depth: Int,_ level: Int){
    guard let currentNode = node else {
        return
    }
    if level < depth-1 {
        dfs(currentNode.left, val, depth, level+1)
        dfs(currentNode.right, val, depth, level+1)
    }
    if level == depth-1 {
        var newLeft = TreeNode(val)
        var newRight = TreeNode(val)

        newLeft.left = currentNode.left
        newRight.right = currentNode.right

        currentNode.left = newLeft
        currentNode.right = newRight
    }
}

// Approach 2
func addOneRow_2(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {

    guard let root else { return nil }
    guard depth != 1 else { return TreeNode(val, root, nil) } // edge case

    var q = [root], level = 2

    while !q.isEmpty {

        for _ in 0..<q.count {
            let node = q.removeFirst()

            if level == depth {
                node.left = TreeNode(val, node.left, nil)
                node.right = TreeNode(val, nil, node.right)
            }

            if let l = node.left {
                q.append(l)
            }

            if let r = node.right {
                q.append(r)
            }
        }
        guard level < depth else { break }
        // optimization: break loop if we already past the target depth
        level += 1
    }

    return root
}

func printTree(_ root: TreeNode?) {
    guard let root = root else { return }
    debugPrint(root.val)
    printTree(root.left)
    printTree(root.right)
}

let tree1 = TreeNode(4, TreeNode(2, TreeNode(3), TreeNode(1)), TreeNode(6, TreeNode(5), nil))
print("\n--------------")
printTree(addOneRow(tree1, 99, 2))

let tree2 = TreeNode(4, TreeNode(2, TreeNode(3), TreeNode(1)), nil)
print("\n--------------")
printTree(addOneRow(tree2, 99, 3))
