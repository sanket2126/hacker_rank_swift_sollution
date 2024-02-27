
// MARK: 141. Linked List Cycle

//https://leetcode.com/problems/linked-list-cycle/description/?envType=daily-question&envId=2024-03-06

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while (fast != nil) && (fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
            if (slow === fast) {
                return true
            }
        }
        return false
    }
}


// TEST
let sol = Solution()

var l2 = ListNode(-4)
var l1 = ListNode(3,ListNode(2, ListNode(0, l2)))
l2.next = l1  // return true with this loc else false

print(sol.hasCycle(l1))
