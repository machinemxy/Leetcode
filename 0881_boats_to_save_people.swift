// https://leetcode.com/problems/boats-to-save-people/

class Solution {
	func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
		var people = people.sorted { $0 >= $1 }
		var boats = 0

		while people.count > 0 {
			boats += 1
			let firstPerson = people.removeFirst()
			let rest = limit - firstPerson

			if people.count > 0 {
				if rest >= people.first! {
					people.removeFirst()
				} else if rest < people.last! {
					continue
				} else {
					var l = 0
					var r = people.count - 1
					while l <= r {
						let mid = (l + r) / 2
						let midPerson = people[mid]
						if midPerson == rest {
							l = mid
							r = mid - 1
						} else if midPerson < rest {
							r = mid - 1
						} else {
							l = mid + 1
						}
					}
					people.remove(at: l)
				}
			}
		}

		return boats
	}
}
