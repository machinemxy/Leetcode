// https://leetcode.com/problems/richest-customer-wealth/

class Solution {
	func maximumWealth(_ accounts: [[Int]]) -> Int {
		var result = 0
		for account in accounts {
			let sum = account.reduce(0) { $0 + $1 }
			result = max(result, sum)
		}
		return result
	}
}
