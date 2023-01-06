// https://leetcode.com/problems/maximum-ice-cream-bars/description/

class Solution {
	func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
		let costs = costs.sorted()
		var coins = coins
		var count = 0
		for cost in costs {
			if coins < cost {
				break
			} else {
				coins -= cost
				count += 1
			}
		}
		return count
	}
}
