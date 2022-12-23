// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/description/

class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		guard prices.count > 1 else { return 0 }
		guard prices.count > 2 else { return max(0, prices[1] - prices[0]) }
		var profits = Array(repeating: 0, count: prices.count)
		var buys = Array(repeating: 0, count: prices.count)
		buys[0] = prices[0]
		buys[1] = min(prices[0], prices[1])
		profits[1] = max(0, prices[1] - prices[0])
		for i in 2..<prices.count {
			let price = prices[i]
			profits[i] = max(profits[i - 1], price - buys[i - 1])
			buys[i] = min(buys[i - 1], price - profits[i - 2])
		}
		return profits[prices.count - 1]
	}
}
