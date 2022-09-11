// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard k > 0 else { return 0 }
        var minPrices = Array(repeating: Int.max, count: k)
        var maxProfits = Array(repeating: 0, count: k)
        for price in prices {
            for i in 0..<k {
                if i == 0 {
                    minPrices[i] = min(minPrices[i], price)
                } else {
                    minPrices[i] = min(minPrices[i], price - maxProfits[i - 1])
                }
                maxProfits[i] = max(maxProfits[i], price - minPrices[i])
            }
        }
        return maxProfits[k - 1]
    }
}
