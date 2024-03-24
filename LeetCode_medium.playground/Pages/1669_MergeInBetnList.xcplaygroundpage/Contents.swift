
// MARK: 1669. Merge In Between Linked Lists

//https://leetcode.com/problems/merge-in-between-linked-lists/description/?envType=daily-question&envId=2024-03-20

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// 1 Approach
func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
    var start : ListNode?
    var end : ListNode?
    var index = 0
    var node = list1
    while node != nil {
        if index == a - 1 {
            start = node
        } else if index == b + 1 {
            end = node
        }
        index += 1
        node = node?.next
    }
    start?.next = list2
    var node2 = list2
    while node2?.next != nil {
        node2 = node2?.next
    }
    node2?.next = end
    return list1
}

// 2 Approach
func mergeInBetween2(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
    var tmp = list1
    var end2 = list2
    var start2: ListNode?
    
    while end2?.next != nil {
        end2 = end2?.next
    }
    var pos = 0
    while (pos < a) {
        tmp = (pos == 0) ? tmp : tmp?.next
        start2 = tmp
        pos += 1
    }
    while pos <= b {
        start2 = start2?.next
        pos += 1
    }
    tmp?.next = list2
    end2?.next = start2?.next
    
    return list1
}

var l1 = ListNode(0,ListNode(1,ListNode(2,ListNode(3,ListNode(4,ListNode(5,ListNode(6)))))))
var l2 = ListNode(1000,ListNode(1001,ListNode(1002,ListNode(1003,ListNode(1004)))))
var hd = mergeInBetween(l1, 2, 5, l2)

while hd != nil {
    print("-",hd?.val ?? 0)
    hd = hd?.next
}
