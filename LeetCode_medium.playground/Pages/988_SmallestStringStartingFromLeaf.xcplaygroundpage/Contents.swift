
// MARK: 988. Smallest String Starting From Leaf

//https://leetcode.com/problems/smallest-string-starting-from-leaf/description/?envType=daily-question&envId=2024-04-17

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

func smallestFromLeaf(_ root: TreeNode?) -> String {
    return dfs(root, "")
}

func dfs(_ root: TreeNode?,_ curr: String) -> String {
    guard let root = root else { return "" }
    var str = curr
    str = String(UnicodeScalar(UInt8( 97 + root.val ))) + str
    
    if let left = root.left, let right = root.right {
        return min(dfs(left, str), dfs(right, str))
    } else if let left = root.left {
        return dfs(left, str)
    } else if let right = root.right {
        return dfs(right, str)
    }
    return str
}

let tree1 = TreeNode(0, TreeNode(1,TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(3), TreeNode(4)))
print("O/P",smallestFromLeaf(tree1))

let tree2 = TreeNode(25, TreeNode(1,TreeNode(1), TreeNode(3)), TreeNode(3, TreeNode(0), TreeNode(2)))
print("O/P",smallestFromLeaf(tree2))

let tree3 = TreeNode(2, TreeNode(2, nil, TreeNode(1, nil, TreeNode(0))), TreeNode(1, TreeNode(0), nil))
print("O/P",smallestFromLeaf(tree3))
