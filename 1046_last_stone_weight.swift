// https://leetcode.com/problems/last-stone-weight/

class Solution {
	func lastStoneWeight(_ stones: [Int]) -> Int {
		var stones = stones.sorted()

		while stones.count > 1 {
			let firstStone = stones.removeLast()
			let secondStond = stones.removeLast()
			let rest = firstStone - secondStond
			if rest != 0 {
				if stones.count == 0 {
					return rest
				} else if rest <= stones.first! {
					stones.insert(rest, at: 0)
				} else if rest >= stones.last! {
					stones.append(rest)
				} else {
					var l = 0
					var r = stones.count - 1
					while l <= r {
						let mid = (l + r) / 2
						let midValue = stones[mid]
						if rest == midValue {
							l = mid
							r = mid - 1
						} else if rest < midValue {
							r = mid - 1
						} else {
							l = mid + 1
						}
					}
					stones.insert(rest, at: l)
				}
			}
		}

		if stones.count == 1 {
			return stones.first!
		} else {
			return 0
		}
	}
}
