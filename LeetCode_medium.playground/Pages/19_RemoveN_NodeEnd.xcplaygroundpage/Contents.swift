// MARK: 19. Remove Nth Node From End of List

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head?.next == nil, n == 1 {
        return nil
    }
    
    var fastPtr = head
    var slowPtr = head
    for _ in 1...n {
        fastPtr = fastPtr?.next
    }
    if fastPtr == nil {
        return head?.next
    }
    while fastPtr?.next != nil {
        fastPtr = fastPtr?.next
        slowPtr = slowPtr?.next
    }
    slowPtr?.next = slowPtr?.next?.next
    return head
}

//MARK: Below one is not space and time efficient
func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
    var head1 = head
    if (head == nil) || (head?.next == nil) {
        return nil
    } else {
        var data = [Int]()
        while head1?.next != nil {
            data.append(head1?.val ?? 0)
            head1 = head1?.next
        }
        data.append(head1?.val ?? 0)
        var result: ListNode?
        var prev : ListNode?
        head1 = nil
        for i in 0..<data.count {
            if i == data.count-n {
                continue
            } else {
                result = ListNode(data[i])
                if (head1 == nil) { head1 = result }
                if prev != nil { prev?.next = result }
                prev = result
            }
        }
        return head1
    }
}

func printList(_ had: ListNode?) {
    var arr = [Int]()
    var head = had
    while head != nil {
        arr.append(head?.val ?? 0)
        head = head?.next
    }
    print("Result -", arr)
}

let List1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
printList(removeNthFromEnd(List1, 2))


let List2 = ListNode(1)
printList(removeNthFromEnd(List2, 1))

let List3 = ListNode(1, ListNode(2))
printList(removeNthFromEnd(List3, 1))


