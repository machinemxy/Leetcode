// https://leetcode.com/problems/queue-reconstruction-by-height/

class Solution {
	func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
		// order by h desc, k asc
		let people = people.sorted { person1, person2 in
			if person1[0] == person2[0] {
				return person1[1] <= person2[1]
			} else {
				return person1[0] >= person2[0]
			}
		}

		var result = [[Int]]()
		for person in people {
			result.insert(person, at: person[1])
		}
		return result
	}
}
