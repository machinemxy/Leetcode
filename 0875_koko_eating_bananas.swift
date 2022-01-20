// https://leetcode.com/problems/koko-eating-bananas/

class Solution {
	private var piles = [Int]()

	func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
		self.piles = piles
		let sum = piles.reduce(0, { $0 + $1 })
		let theoreticallyFastest: Int
		if sum % h == 0 {
			theoreticallyFastest = sum / h
		} else {
			theoreticallyFastest = sum / h + 1
		}
		let theoreticallySlowest = piles.max()!

		var bestSpeed = theoreticallySlowest
		var l = theoreticallyFastest
		var r = theoreticallySlowest
		while l <= r {
			let mid = (l + r) / 2
			let eatHours = eatHours(speed: mid)
			if eatHours <= h {
				bestSpeed = mid
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		return bestSpeed
	}

	private func eatHours(speed: Int) -> Int {
		return piles.reduce(0) { result, pile in
			if pile % speed == 0 {
				return result + pile / speed
			} else {
				return result + pile / speed + 1
			}
		}
	}
}
