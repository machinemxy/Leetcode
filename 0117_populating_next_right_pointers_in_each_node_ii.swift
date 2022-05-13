// https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
	func connect(_ root: Node?) -> Node? {
		guard let root = root else { return nil }

		var firstNodeInPreviousRow: Node? = root

		while firstNodeInPreviousRow != nil {
			var nodeInPreviousRow = firstNodeInPreviousRow
			var firstNodeInCurrentRow: Node?
			var previousNodeInCurrentRow: Node?

			while nodeInPreviousRow != nil {
				if let left = nodeInPreviousRow?.left {
					if firstNodeInCurrentRow == nil {
						firstNodeInCurrentRow = left
					} else {
						previousNodeInCurrentRow?.next = left
					}
					previousNodeInCurrentRow = left
				}

				if let right = nodeInPreviousRow?.right {
					if firstNodeInCurrentRow == nil {
						firstNodeInCurrentRow = right
					} else {
						previousNodeInCurrentRow?.next = right
					}
					previousNodeInCurrentRow = right
				}

				nodeInPreviousRow = nodeInPreviousRow?.next
			}

			firstNodeInPreviousRow = firstNodeInCurrentRow
		}

		return root
	}
}
