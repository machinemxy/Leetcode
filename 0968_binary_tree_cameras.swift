// https://leetcode.com/problems/binary-tree-cameras/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
	private var cameraCount = 0

	func minCameraCover(_ root: TreeNode?) -> Int {
		let status = check(node: root!)
		if status == .underCamera {
			cameraCount += 1
		}
		return cameraCount
	}

	private func check(node: TreeNode) -> Status {
		if let left = node.left {
			if let right = node.right {
				let leftStatus = check(node: left)
				let rightStatus = check(node: right)
				if leftStatus == .underCamera || rightStatus  == .underCamera {
					cameraCount += 1
					return .camera
				} else if leftStatus == .camera || rightStatus == .camera {
					return .aboveCamera
				} else {
					return .underCamera
				}
			} else {
				let leftStatus = check(node: left)
				let status = leftStatus.next()
				if status == .camera {
					cameraCount += 1
				}
				return status
			}
		} else {
			if let right = node.right {
				let rightStatus = check(node: right)
				let status = rightStatus.next()
				if status == .camera {
					cameraCount += 1
				}
				return status
			} else {
				return .underCamera
			}
		}
	}
}

fileprivate enum Status {
	case underCamera, camera, aboveCamera

	func next() -> Status {
		switch self {
			case .underCamera:
				return .camera
			case .camera:
				return .aboveCamera
			case .aboveCamera:
				return .underCamera
		}
	}
}
