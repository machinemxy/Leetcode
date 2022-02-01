// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		if prices.count == 1 { return 0 }

		var maxProfit = 0
		var highestSellingPrice = 0
		for buyingTiming in stride(from: prices.count - 2, through: 0, by: -1) {
			highestSellingPrice = max(highestSellingPrice, prices[buyingTiming + 1])
			let profit = highestSellingPrice - prices[buyingTiming]
			maxProfit = max(profit, maxProfit)
		}

		return maxProfit
	}
}
