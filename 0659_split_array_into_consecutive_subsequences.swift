// https://leetcode.com/problems/split-array-into-consecutive-subsequences/

class Solution {
	func isPossible(_ nums: [Int]) -> Bool {
		var store = [StartEndPair]()

		for num in nums {
			var added = false

			for i in stride(from: store.count - 1, through: 0, by: -1) {
				if !added {
					if num == store[i].end + 1 {
						store[i].end = num
						added = true
						break
					}
				}

				if num > store[i].end + 1 {
					if store[i].end - store[i].start < 2 {
						return false
					}
					store.remove(at: i)
				}
			}

			if !added {
				store.append(StartEndPair(start: num, end: num))
			}
		}

		for startEndPair in store {
			if startEndPair.end - startEndPair.start < 2 {
				return false
			}
		}
		return true
	}
}

fileprivate struct StartEndPair {
	var start: Int
	var end: Int
}
