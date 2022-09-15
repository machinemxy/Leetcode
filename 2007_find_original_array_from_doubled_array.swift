// https://leetcode.com/problems/find-original-array-from-doubled-array/

class Solution {
	func findOriginalArray(_ changed: [Int]) -> [Int] {
		if changed.count % 2 != 0 { return [] }

		var result = [Int]()
		let changed = changed.sorted()
		var frequencyDic = Dictionary<Int, Int>()
		for num in changed {
			frequencyDic[num] = frequencyDic[num, default: 0] + 1
		}
		for num in changed {
			if let count = frequencyDic[num] {
				result.append(num)
				if count == 1 {
					frequencyDic.removeValue(forKey: num)
				} else {
					frequencyDic[num] = count - 1
				}

				let doubleNum = num * 2
				if let count = frequencyDic[doubleNum] {
					if count == 1 {
						frequencyDic.removeValue(forKey: doubleNum)
					} else {
						frequencyDic[doubleNum] = count - 1
					}
				} else {
					return []
				}
			}
		}

		return result
	}
}
