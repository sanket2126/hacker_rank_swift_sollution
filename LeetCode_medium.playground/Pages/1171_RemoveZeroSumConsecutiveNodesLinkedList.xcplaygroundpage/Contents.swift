
import Foundation

// MARK: 1171. Remove Zero Sum Consecutive Nodes from Linked List

//https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/?envType=daily-question&envId=2024-03-12

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
    var new_head = head
    var slow = head
    var fast = head?.next
    var prev = slow
    var array: [Int] = [slow?.val ?? 0]
    var count = 1
    
    while fast != nil {
        count += 1
        array = array.map({ ($0 == 0) ? 0 : $0 + (fast?.val ?? 0) })
        array.append((fast?.val ?? 0))
        
        if let index = array.firstIndex(of: 0) {
            if (index == 0) {
                array.removeFirst(count)
                // (array.isEmpty) ? fast :
                new_head = fast?.next
                prev = fast?.next
                slow = fast?.next
            } else {
                var move = 1
                prev = new_head
                while move < index {
                    prev = prev?.next
                    move += 1
                }
                array.removeSubrange(index...(count-1))
                prev?.next = fast?.next
                slow = prev
            }
            count = 1
        }
        fast = fast?.next
    }
    if array.count == 1 {
        if let val = array.first, val == 0 {
            return nil
        }
    }
    return new_head
}

func printList(ll: ListNode) {
    print("\n\n NEW LIST")
    var hd = removeZeroSumSublists(ll)
    while hd != nil {
        print("Result ",hd?.val)
        hd = hd?.next
    }
}

var l1 = ListNode(1, ListNode(2,ListNode(-3, ListNode(-1, ListNode(2)))))
var l2 = ListNode(1, ListNode(2,ListNode(3, ListNode(-3, ListNode(4)))))
var l3 = ListNode(0,ListNode(2))

printList(ll: l1)
printList(ll: l2)
printList(ll: l3)
