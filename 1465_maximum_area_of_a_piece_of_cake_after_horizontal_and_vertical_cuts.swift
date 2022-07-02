// https://leetcode.com/problems/maximum-area-of-a-piece-of-cake-after-horizontal-and-vertical-cuts/

class Solution {
	func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
		var previousHorizontalCut = 0
		var maxHorizontalCutDiff = 0
		for horizontalCut in horizontalCuts.sorted() {
			let horizontalCutDiff = horizontalCut - previousHorizontalCut
			maxHorizontalCutDiff = max(maxHorizontalCutDiff,horizontalCutDiff)
			previousHorizontalCut = horizontalCut
		}
		let finalHorizontalCutDiff = h - previousHorizontalCut
		maxHorizontalCutDiff = max(maxHorizontalCutDiff, finalHorizontalCutDiff)

		var previousVerticalCut = 0
		var maxVerticalCutDiff = 0
		for verticalCut in verticalCuts.sorted() {
			let verticalCutDiff = verticalCut - previousVerticalCut
			maxVerticalCutDiff = max(maxVerticalCutDiff, verticalCutDiff)
			previousVerticalCut = verticalCut
		}
		let finalVerticalCutDiff = w - previousVerticalCut
		maxVerticalCutDiff = max(maxVerticalCutDiff, finalVerticalCutDiff)

		return maxHorizontalCutDiff * maxVerticalCutDiff % 1000000007
	}
}

