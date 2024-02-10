
import Foundation
//MARK: Reverse the Doubly Linked list
/*
 Given the pointer to the head node of a doubly linked list, reverse the order of the nodes in place. That is, change the next and prev pointers of the nodes so that the direction of the list is reversed. Return a reference to the head node of the reversed list.

 Note: The head node might be NULL to indicate that the list is empty.
 
 Complete the reverse function in the editor below.

 reverse has the following parameter(s):

 DoublyLinkedListNode head: a reference to the head of a DoublyLinkedList
 Returns
 - DoublyLinkedListNode: a reference to the head of the reversed list


 */

final class DoublyLinkedListNode {
    var data: Int
    var next: DoublyLinkedListNode?
    weak var prev: DoublyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class DoublyLinkedList {
    var head: DoublyLinkedListNode?
    var tail: DoublyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: DoublyLinkedListNode) {
        if let tail = tail {
            tail.next = node
            node.prev = tail
        } else {
            head = node
        }

        tail = node
    }
}

// This can be used when need to add answer into file.
//func printDoublyLinkedList(head: DoublyLinkedListNode?, sep: String, fileHandle: FileHandle) {
//    var node = head
//
//    while node != nil {
//        fileHandle.write(String(node!.data).data(using: .utf8)!)
//        print(node?.data)
//        node = node!.next
//
//        if node != nil {
//            fileHandle.write(sep.data(using: .utf8)!)
//        }
//    }
//}

// MARK: Above code is just for example
func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    var current: DoublyLinkedListNode? = llist
    var stack = [Int]()

    while (current != nil) {
        stack.append(current?.data ?? 0)
        current = current?.next
    }
    current = llist
    while (current != nil) {
        current?.data = stack.removeLast()
        current = current?.next
    }
    return llist
}

//MARK: Below code is only for testing in the above function
let llist = DoublyLinkedList()
let listData = [3,2,4,6,7]
for d in listData {
    llist.insertNode(nodeData: d)
}
var reverseList = reverse(llist: llist.head!)
while reverseList != nil {
    print(reverseList?.data ?? 0)
    reverseList = reverseList?.next
}
