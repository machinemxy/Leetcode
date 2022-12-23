// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/

class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		var prevProfit = 0
		var prevBuy = Int.max
		for price in prices {
			let profit = max(prevProfit, price - prevBuy)
			let buy = min(prevBuy, price - prevProfit)
			prevProfit = profit
			prevBuy = buy
		}
		return prevProfit
	}
}
