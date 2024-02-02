
// Hacker rank week 3 trial

//----------------------------------------------------------------------------------
//final class DoublyLinkedListNode {
//    var data: Int
//    var next: DoublyLinkedListNode?
//    weak var prev: DoublyLinkedListNode?
//
//    public init(nodeData: Int) {
//        self.data = nodeData
//    }
//}

//final class DoublyLinkedList {
//    var head: DoublyLinkedListNode?
//    var tail: DoublyLinkedListNode?
//
//    public init() {}
//
//    public func insertNode(nodeData: Int) {
//        self.insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
//    }
//
//    private func insertNode(node: DoublyLinkedListNode) {
//        if let tail = tail {
//            tail.next = node
//            node.prev = tail
//        } else {
//            head = node
//        }
//
//        tail = node
//    }
//}

//func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
//
//    var current: DoublyLinkedListNode? = llist
//    var temp: DoublyLinkedListNode?
//
//    var stack = [Int]()
//
//    while (current != nil) {
//        stack.append(current?.data ?? 0)
//        current = current?.next
//    }
//    current = llist
//    while (current != nil) {
//        current?.data = stack.removeLast()
//        current = current?.next
//    }
//
//    repeat {
//        temp = current?.prev
//        current?.prev = current?.next
//        print("data -",current?.data ?? 0, "next -", current?.next?.data ?? 0,"prev -",current?.prev?.data ?? 0, "temp -",temp?.data ?? 0)
//
//        current?.next = temp
//        print("data -",current?.data ?? 0, "next -", current?.next?.data ?? 0,"prev -",current?.prev?.data ?? 0, "temp -",temp?.data ?? 0)
//
//        current = current?.prev
//        print("data -",current?.data, ",next -", current?.next?.data,",prev -" ,current?.prev?.data, ",temp -",temp?.data)
//    } while (current != nil)
//
//    if temp != nil{
//        current = temp?.prev
//    }
//    return llist
//}

//var dl = DoublyLinkedList()
//dl.insertNode(nodeData: 4)
//dl.insertNode(nodeData: 5)
//dl.insertNode(nodeData: 2)
//dl.insertNode(nodeData: 6)
//var r = reverse(llist: dl.head)
////print(r?.data)
//while r != nil {
//    print("LL -",r?.data)
//    r = r?.next
//}

//----------------------------------------------------------------------------------
//Week 3 sollution
//----------------------------------------------------------------------------------

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    init(nodeData: Int) {
      self.data = nodeData
    }
}
//
final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func mergeLists(head1: SinglyLinkedListNode?, head2: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var first = head1
    var sec = head2
    var finale: SinglyLinkedListNode? = nil
    var head: SinglyLinkedListNode? = nil

    while (first != nil || sec != nil) {
        if (first?.data ?? Int.max) < (sec?.data ?? Int.max) {
            var temp = first
            if finale == nil {
                first = first?.next
                temp?.next = nil
                finale = temp
                head = finale
            } else {
                first = first?.next
                temp?.next = nil
                finale?.next = temp
                finale = finale?.next
            }
        } else {
            var tmp = sec
            if finale == nil {
                sec = sec?.next
                tmp?.next = nil
                finale = tmp
                head = finale
            } else {
                sec = sec?.next
                tmp?.next = nil
                finale?.next = tmp
                finale = finale?.next
            }
        }
    }

    return head
}

let sll = SinglyLinkedList()
sll.insertNode(nodeData: 1)
sll.insertNode(nodeData: 3)
sll.insertNode(nodeData: 4)
sll.insertNode(nodeData: 6)

let sll2 = SinglyLinkedList()
sll2.insertNode(nodeData: 2)
sll2.insertNode(nodeData: 5)
sll2.insertNode(nodeData: 7)

var p = mergeLists(head1: sll.head, head2: sll2.head)

print("\nFinal result")
while p != nil {
    print(p?.data)
    p = p?.next
}
//-----------------------------------------

/*
 /* Same above Solution in Node.js */
 'use strict';

 const SinglyLinkedListNode = class {
     constructor(nodeData) {
         this.data = nodeData;
         this.next = null;
     }
 };

 const SinglyLinkedList = class {
     constructor() {
         this.head = null;
         this.tail = null;
     }

     insertNode(nodeData) {
         const node = new SinglyLinkedListNode(nodeData);

         if (this.head == null) {
             this.head = node;
         } else {
             this.tail.next = node;
         }

         this.tail = node;
     }
 };

 function printSinglyLinkedList(node, sep, ws) {
     while (node != null) {
         ws.write(String(node.data));

         node = node.next;

         if (node != null) {
             ws.write(sep);
         }
     }
 }

 function mergeLists(head1, head2) {
     var first = head1, sec = head2
     var finale, head
     
     while (first != null || sec != null) {
       let f = (first == null) ? Number.MAX_SAFE_INTEGER : first.data
       let s = (sec == null) ? Number.MAX_SAFE_INTEGER : sec.data
       console.log(f,s)
       
         if (f < s) {
             var temp = first
             if (finale == null) {
                 first = first.next
                 temp.next = null
                 finale = temp
                 head = finale
             } else {
                 first = first.next
                 temp.next = null
                 finale.next = temp
                 finale = finale.next
             }
         } else {
             var tmp = sec
             if (finale == null) {
                 sec = sec.next
                 tmp.next = null
                 finale = tmp
                 head = finale
             } else {
                 sec = sec.next
                 tmp.next = null
                 finale.next = tmp
                 finale = finale.next
             }
         }
     }
     return head
 }

     let sll = new SinglyLinkedList()
     sll.insertNode(1)
     sll.insertNode(3)
     sll.insertNode(4)
     sll.insertNode(6)

     let sll2 = new SinglyLinkedList()
     sll2.insertNode(2)
     sll2.insertNode(5)
     sll2.insertNode(7)

 var p = mergeLists(sll.head, sll2.head)

 console.log("\nFinal result")
 while (p != null) {
     console.log(p.data)
     p = p.next
 }
*/

