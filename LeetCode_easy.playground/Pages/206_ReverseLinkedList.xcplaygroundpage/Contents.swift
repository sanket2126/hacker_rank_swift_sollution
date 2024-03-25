
// MARK: 206. Reverse Linked List

//https://leetcode.com/problems/reverse-linked-list/description/

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

func reverseList(_ head: ListNode?) -> ListNode? {
    var tmp : ListNode?
    var front = head?.next
    var back = head
    if back == nil || front == nil {
        return head
    }
    back?.next = nil
    while front != nil {
        tmp = front?.next
        front?.next = back
        back = front
        front = tmp
    }

    return back
}


var l1 = ListNode(3,ListNode(2, ListNode(0, ListNode(5))))
var rev = reverseList(l1)

while rev != nil {
    print(rev?.val)
    rev = rev?.next
}
