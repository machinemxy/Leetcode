// https://leetcode.com/problems/my-calendar-i/

class MyCalendar {
	private var reserved = [Interval]()

	init() {}

	func book(_ start: Int, _ end: Int) -> Bool {
		if reserved.isEmpty {
			reserved.append(Interval(start: start, end: end))
			return true
		}

		var l = 0
		var r = reserved.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVal = reserved[mid]
			if end <= midVal.start {
				r = mid - 1
			} else if start >= midVal.end {
				l = mid + 1
			} else {
				return false
			}
		}
		reserved.insert(Interval(start: start, end: end), at: l)
		return true
	}
}

fileprivate struct Interval {
	let start: Int
	let end: Int
}
