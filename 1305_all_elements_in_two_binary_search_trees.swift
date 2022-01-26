// https://leetcode.com/problems/all-elements-in-two-binary-search-trees/

class Solution {
	private var arrs = Array(repeating: [Int](), count: 2)

	func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
		if let root1 = root1 {
			append(node: root1, to: 0)
		}

		if let root2 = root2 {
			append(node: root2, to: 1)
		}

		var result = [Int]()
		var i0 = 0
		var i1 = 0
		while true {
			if i0 >= arrs[0].count && i1 >= arrs[1].count {
				break
			} else if i0 >= arrs[0].count {
				result.append(arrs[1][i1])
				i1 += 1
			} else if i1 >= arrs[1].count {
				result.append(arrs[0][i0])
				i0 += 1
			} else {
				if arrs[0][i0] <= arrs[1][i1] {
					result.append(arrs[0][i0])
					i0 += 1
				} else {
					result.append(arrs[1][i1])
					i1 += 1
				}
			}
		}

		return result
	}

	private func append(node: TreeNode, to arrId: Int) {
		if let left = node.left {
			append(node: left, to: arrId)
		}
		arrs[arrId].append(node.val)
		if let right = node.right {
			append(node: right, to: arrId)
		}
	}
}
