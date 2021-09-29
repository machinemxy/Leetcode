// https://leetcode.com/problems/split-linked-list-in-parts/

class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        // calculate count
        var count = 0
        var countNode = head
        while true {
            if let unwrappedCountNode = countNode {
                count += 1
                countNode = unwrappedCountNode.next
            } else {
                break
            }
        }

        // calculate nodes required in each group
        let nodeEachGroup = count / k
        var countArray = Array(repeating: nodeEachGroup, count: k)
        let rest = count % k
        for i in 0..<rest {
            countArray[i] += 1
        }

        // create the result
        var result = [ListNode?]()
        var tempNode = head
        for countOfEachGroup in countArray {
            var listNode: ListNode? = nil
            var deepestNodeInListNode: ListNode? = nil
            for _ in 0..<countOfEachGroup {
                if let unwrappedTempNode = tempNode {
                    if listNode == nil {
                        listNode = ListNode(unwrappedTempNode.val)
                        deepestNodeInListNode = listNode
                    } else {
                        deepestNodeInListNode?.next = ListNode(unwrappedTempNode.val)
                        deepestNodeInListNode = deepestNodeInListNode?.next
                    }
                    tempNode = unwrappedTempNode.next
                }
            }
            result.append(listNode)
        }

        return result
    }
}
