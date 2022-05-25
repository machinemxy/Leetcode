// https://leetcode.com/problems/russian-doll-envelopes/

class Solution {
	func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
		let sortedEnvelopes = envelopes.sorted {
			if $0[0] == $1[0] {
				return $0[1] >= $1[1]
			} else {
				return $0[0] < $1[0]
			}
		}

		let heights = sortedEnvelopes.map { $0[1] }
		var stack = [Int]()

		for height in heights {
			if stack.count == 0 || height > stack.last! {
				stack.append(height)
			} else {
				var l = 0
				var r = stack.count - 1

				while l < r {
					let mid = (l + r) / 2
					let midValue = stack[mid]

					if height > midValue {
						l = mid + 1
					} else {
						r = mid
					}
				}

				stack[l] = height
			}
		}

		return stack.count
	}
}
