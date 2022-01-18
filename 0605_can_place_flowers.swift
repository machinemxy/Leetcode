// https://leetcode.com/problems/can-place-flowers/

class Solution {
	var flowerbed = [Int]()

	func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
		if n == 0 { return true }

		self.flowerbed = flowerbed
		var n = n

		for i in 0..<flowerbed.count {
			if flowerbed[i] == 0 && isTwoSideEmpty(at: i) {
				n = n - 1
				if n == 0 {
					return true
				}
				self.flowerbed[i] = 1
			}
		}

		return false
	}

	private func isTwoSideEmpty(at i: Int) -> Bool {
		let left = i - 1
		let right = i + 1
		if left >= 0 && flowerbed[left] == 1 {
			return false
		}
		if right < flowerbed.count && flowerbed[right] == 1{
			return false
		}
		return true
	}
}
