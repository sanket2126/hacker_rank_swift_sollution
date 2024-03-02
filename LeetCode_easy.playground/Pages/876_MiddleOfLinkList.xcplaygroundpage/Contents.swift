
//MARK: 876. Middle of the Linked List

//https://leetcode.com/problems/middle-of-the-linked-list/description/?envType=daily-question&envId=2024-03-07

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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while (fast != nil) && (fast?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}

// TEST
let sol = Solution()

var l1 = ListNode(3,ListNode(2, ListNode(5, ListNode(12, ListNode(9)))))

print(sol.middleNode(l1)?.val) // from 5


var l2 = ListNode(7,ListNode(1, ListNode(3, ListNode(11))))
print(sol.middleNode(l2)?.val) // 3
