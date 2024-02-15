
/*
 MARK: You are given the head of a linked list, which contains a series of integers separated by 0's. The beginning and end of the linked list will have Node.val == 0.

 MARK: For every two consecutive 0's, merge all the nodes lying in between them into a single node whose value is the sum of all the merged nodes. The modified list should not contain any 0's.

 Return the head of the modified linked list.
 Input: head = [0,3,1,0,4,5,2,0]
 Output: [4,11]
 Explanation:
 The above figure represents the given linked list. The modified list contains
 The sum of the nodes marked in green: 3 + 1 = 4.
 The sum of the nodes marked in red: 4 + 5 + 2 = 11.
 Prasad K
 12:32 PM
 
 */
/*
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init( val: Int,  next: ListNode?) { self.val = val; self.next = next; }
}
*/
class ListNode {
    var data: Int
    var next: ListNode?
    
    init(_ node: Int) {
        data = node
        next = nil
    }
}

class SinglyLinkedList {
    var head: ListNode?
    var tail: ListNode?

    init() {
        head = nil
        tail = nil
    }

    func insertNode(nodeData: Int) {
        var node = ListNode(nodeData)

        if (head == nil) {
            head = node;
        } else {
            tail?.next = node;
        }

        tail = node;
    }
}

class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var list = head
        var newHead = list, prev = list
        var sum = 0
        while list != nil {
            if list?.data == 0, sum > 0 {
                if prev?.data == 0 { // will work for first node
                    prev?.data = sum
                } else {
                    prev?.next = ListNode(sum)
                    prev = prev?.next
                }
                sum = 0
            } else {
                sum += list?.data ?? 0
            }
            list = list?.next
        }
        if sum > 0 { // if last node is not having zero element then this will work
            prev?.next = ListNode(sum)
            prev = prev?.next
            sum = 0
        }
        return newHead
    }
}

// Just for example to check the above code.
let llist = SinglyLinkedList()
let listData = [0,3,1,0,4,5,2,0,3,4,0,1,2,2,0]
for d in listData {
    llist.insertNode(nodeData: d)
}
var sol = Solution()
var mergedList = sol.mergeNodes(llist.head)
while mergedList != nil {
    print(mergedList?.data ?? 0)
    mergedList = mergedList?.next
}
