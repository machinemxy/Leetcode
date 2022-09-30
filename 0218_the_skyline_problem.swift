// https://leetcode.com/problems/the-skyline-problem/
// https://www.youtube.com/watch?v=GSBLe8cKu0s

class Solution {
	func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
		var rects = [Rect]()
		for building in buildings {
			rects.append(Rect(x: building[0], y: building[2], isStart: true))
			rects.append(Rect(x: building[1], y: building[2], isStart: false))
		}
		rects.sort()

		var heightStack = [0]
		var result = [[Int]]()
		for rect in rects {
			if rect.isStart {
				if rect.y > heightStack.last! {
					result.append([rect.x, rect.y])
					heightStack.append(rect.y)
				} else {
					heightStack = addHeight(height: rect.y, stack: heightStack)
				}
			} else {
				if rect.y == heightStack.last! {
					let heightStackCount = heightStack.count
					if heightStack[heightStackCount - 1] == heightStack[heightStackCount - 2] {
						heightStack.removeLast()
					} else {
						heightStack.removeLast()
						result.append([rect.x, heightStack.last!])
					}
				} else {
					heightStack = removeHeight(height: rect.y, stack: heightStack)
				}
			}
		}
		return result
	}

	func addHeight(height: Int, stack: [Int]) -> [Int] {
		var stack = stack
		var l = 0
		var r = stack.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVar = stack[mid]
			if height < midVar {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		stack.insert(height, at: l)
		return stack
	}

	func removeHeight(height: Int, stack: [Int]) -> [Int] {
		var stack = stack
		var l = 0
		var r = stack.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVal = stack[mid]
			if height == midVal {
				l = mid
				break
			} else if height < midVal {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		stack.remove(at: l)
		return stack
	}
}

struct Rect: Comparable {
	let x: Int
	let y: Int
	let isStart: Bool

	static func < (lhs: Rect, rhs: Rect) -> Bool {
		if lhs.x == rhs.x {
			if lhs.isStart == rhs.isStart {
				if lhs.isStart {
					return lhs.y > rhs.y
				} else {
					return lhs.y < rhs.y
				}
			} else {
				if lhs.isStart {
					return true
				} else {
					return false
				}
			}
		} else {
			return lhs.x < rhs.x
		}
	}
}
