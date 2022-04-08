// https://leetcode.com/problems/kth-largest-element-in-a-stream/

class KthLargest {
	private var sortedNums: [Int]
	private var k: Int

	init(_ k: Int, _ nums: [Int]) {
		sortedNums = nums.sorted(by: { $0 >= $1 })
		self.k = k
	}

	func add(_ val: Int) -> Int {
		if sortedNums.count == 0 {
			sortedNums.append(val)
		} else if val >= sortedNums.first! {
			sortedNums.insert(val, at: 0)
		} else if val <= sortedNums.last! {
			sortedNums.append(val)
		} else {
			var l = 0
			var r = sortedNums.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midval = sortedNums[mid]
				if val == midval {
					l = mid
					r = mid - 1
				} else if val > midval {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
			sortedNums.insert(val, at: l)
		}

		return sortedNums[k - 1]
	}
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
