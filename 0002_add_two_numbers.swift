// https://leetcode.com/problems/add-two-numbers/

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var tl1 = l1
        var tl2 = l2
        var result: ListNode? = nil
        var resultDeepestNode = result
        var jinwei = false

        while true {
            if tl1 == nil && tl2 == nil {
                if jinwei {
                    let newNode = ListNode(1)
                    if result == nil {
                        result = newNode
                        resultDeepestNode = newNode
                    } else {
                        resultDeepestNode?.next = newNode
                        resultDeepestNode = newNode
                    }
                }
                break
            } else {
                let oneOrZero = jinwei ? 1 : 0
                var plusResult = (tl1?.val ?? 0) + (tl2?.val ?? 0) + oneOrZero
                if plusResult > 9 {
                    plusResult -= 10
                    jinwei = true
                } else {
                    jinwei = false
                }

                let newNode = ListNode(plusResult)
                if result == nil {
                    result = newNode
                    resultDeepestNode = newNode
                } else {
                    resultDeepestNode?.next = newNode
                    resultDeepestNode = newNode
                }
            }

            tl1 = tl1?.next
            tl2 = tl2?.next
        }

        return result
    }
}
