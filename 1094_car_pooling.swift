// https://leetcode.com/problems/car-pooling/

class Solution {
	func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
		var stations = Array(repeating: 0, count: 1000)

		for trip in trips {
			for i in trip[1]..<trip[2] {
				stations[i] += trip[0]
				if stations[i] > capacity {
					return false
				}
			}
		}

		return true
	}
}
