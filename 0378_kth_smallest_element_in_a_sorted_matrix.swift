// https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/

class Solution {
	func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
		var stack = [Int]()

		for row in matrix {
			for num in row {
				if stack.isEmpty {
					stack.append(num)
					continue
				}

				if num >= stack.last! {
					if stack.count == k {
						continue
					} else {
						stack.append(num)
						continue
					}
				}

				var l = 0
				var r = stack.count - 1
				while l <= r {
					let mid = (l + r) / 2
					let midVal = stack[mid]
					if num <= midVal {
						r = mid - 1
					} else {
						l = mid + 1
					}
				}
				stack.insert(num, at: l)
				if stack.count > k {
					stack.removeLast()
				}
			}
		}

		return stack.last!
	}
}
