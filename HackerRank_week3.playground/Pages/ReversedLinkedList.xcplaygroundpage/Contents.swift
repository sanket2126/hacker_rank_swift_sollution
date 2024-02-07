
import Foundation
//MARK: Reverse the Singly Linked list
/*
 Given the pointer to the head node of a linked list, change the next pointers of the nodes so that their order is reversed. The head pointer given may be null meaning that the initial list is empty.
 
 reverse has the following parameter:
 SinglyLinkedListNode pointer head: a reference to the head of a list
 
 Returns
 SinglyLinkedListNode pointer: a reference to the head of the reversed list
 */

class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    
    init(_ node: Int) {
        data = node
        next = nil
    }
}

class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    init() {
        head = nil
        tail = nil
    }

    func insertNode(nodeData: Int) {
        var node = SinglyLinkedListNode(nodeData)

        if (head == nil) {
            head = node;
        } else {
            tail?.next = node;
        }

        tail = node;
    }
}

// MARK: Above code is just for example
func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Write your code here
    var prev: SinglyLinkedListNode? = nil
    var next: SinglyLinkedListNode? = nil
    var current: SinglyLinkedListNode? = llist
    
    while current != nil {
      next = current?.next
      current?.next = prev
      prev = current
      current = next
    }
    current = prev
    return current
}

//MARK: Below code is only for testing in the above function
let llist = SinglyLinkedList()
let listData = [3,2,4,6,7]
for d in listData {
    llist.insertNode(nodeData: d)
}
var reverseList = reverse(llist: llist.head!)
while reverseList != nil {
    print(reverseList?.data ?? 0)
    reverseList = reverseList?.next
}
