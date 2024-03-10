// MARK: 513. Find Bottom Left Tree Value

// https://leetcode.com/problems/find-bottom-left-tree-value/

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

func findBottomLeftValue(_ root: TreeNode?) -> Int {
    var deck : [TreeNode?]
    var val : Int = -1
    guard let root else { return -1 }
    deck = [root]
    var j = 0
    while !deck.isEmpty {
        guard let node = deck.removeFirst()  else { return -1 }
        val = node.val
        j+=1
//        print(j,val)
        if let rightnode = node.right {
            deck.append(rightnode)
        }
        if let leftnode = node.left {
            deck.append(leftnode)
        }
    }
    return val
}

let tree1 = TreeNode(2,TreeNode(1),TreeNode(3))
print("Result -",findBottomLeftValue(tree1))


let tree2 = TreeNode(1,TreeNode(2, TreeNode(4), nil),TreeNode(3, TreeNode(5, TreeNode(7), nil), TreeNode(6)))
print("Result -",findBottomLeftValue(tree2))
