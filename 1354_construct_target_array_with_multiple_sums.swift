// https://leetcode.com/problems/construct-target-array-with-multiple-sums/

class Solution {
	private var sortedList = [Int]()

	func isPossible(_ target: [Int]) -> Bool {
		if target.count == 1 {
			if target == [1] {
				return true
			} else {
				return false
			}
		}

		sortedList = target.sorted()
		var sortedListSum = sortedList.reduce(0) { $0 + $1 }

		while sortedList.last! != 1 {
			let last = sortedList.removeLast()
			sortedListSum -= last
			if sortedListSum == 1 { return true }
			let lastBeforeAdded = last % sortedListSum
			if lastBeforeAdded == 0 || lastBeforeAdded == last {
				return false
			} else {
				insertNumberToSortedList(number: lastBeforeAdded)
				sortedListSum += lastBeforeAdded
			}
		}

		return true
	}

	private func insertNumberToSortedList(number: Int) {
		if sortedList.isEmpty {
			sortedList.append(number)
			return
		}

		var l = 0
		var r = sortedList.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVal = sortedList[mid]
			if number == midVal {
				l = mid
				break
			} else if number < midVal {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		sortedList.insert(number, at: l)
	}
}
