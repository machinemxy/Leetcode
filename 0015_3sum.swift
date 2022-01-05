// https://leetcode.com/problems/3sum/

class Solution {
	func threeSum(_ nums: [Int]) -> [[Int]] {
		guard nums.count >= 3 else { return [[Int]]() }

		var numIdDic = Dictionary<Int, [Int]>()
		var setResult = Set<[Int]>()

		for (i, num) in nums.enumerated() {
			if numIdDic.keys.contains(num) {
				var ids = numIdDic[num]!
				ids.append(i)
				numIdDic[num] = ids
			} else {
				numIdDic[num] = [i]
			}
		}

		for x in 0..<(nums.count - 1) {
			for y in (x + 1)..<nums.count {
				let anotherNum = 0 - nums[x] - nums[y]
				guard let ids = numIdDic[anotherNum] else { continue }
				if ids.contains(where: { ($0 != x) && ($0 != y) }) {
					let sortedArray = [nums[x], nums[y], anotherNum].sorted()
					setResult.insert(sortedArray)
				}
			}
		}

		return Array(setResult)
	}
}
