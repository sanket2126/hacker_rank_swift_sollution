
// MARK: 143. Reorder List

//https://leetcode.com/problems/reorder-list/description/?envType=daily-question&envId=2024-03-23

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reorderList(_ head: ListNode?) {
    let start = head
    var ptr = start
    var arr : [Int] = []
    while(ptr != nil) {
        arr.append(ptr?.val ?? 0)
        ptr = ptr?.next
    }
    var i = 0, j = arr.count-1
    ptr = start
    var flag = true
    while i <= j {
        if flag {
            ptr?.val = arr[i]
            i += 1
        } else {
            ptr?.val = arr[j]
            j -= 1
        }
        ptr = ptr?.next
        flag.toggle()
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

let l1 = ListNode(1,ListNode(2,ListNode(3,ListNode(4))))
reorderList(l1)
printList(l1)

let l2 = ListNode(10,ListNode(30,ListNode(50,ListNode(40, ListNode(20)))))
reorderList(l2)
printList(l2)
