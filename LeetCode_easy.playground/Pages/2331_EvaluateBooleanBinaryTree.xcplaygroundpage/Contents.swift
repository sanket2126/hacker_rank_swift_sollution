
// MARK: 2331. Evaluate Boolean Binary Tree

//https://leetcode.com/problems/evaluate-boolean-binary-tree/description/?envType=daily-question&envId=2024-05-16

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

func evaluateTree(_ root: TreeNode?) -> Bool {
    let val = root?.val ?? 0
    switch val {
        case 0: return false
        case 1: return true
        case 2: return evaluateTree(root?.left) || evaluateTree(root?.right)
        case 3: return evaluateTree(root?.left) && evaluateTree(root?.right)
        default:
            return false
    }
}

let tree1 = TreeNode(0)
print("O/P -", evaluateTree(tree1))

let tree2 = TreeNode(2, TreeNode(1, nil, nil), TreeNode(3, TreeNode(0), TreeNode(1)))
print("O/P -", evaluateTree(tree2))
