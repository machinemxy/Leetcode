// https://leetcode.com/problems/possible-bipartition/description/

class Solution {
	func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
		var dic = Dictionary<Int, Set<Int>>()
		for dislike in dislikes {
			let person1 = dislike[0] - 1
			let person2 = dislike[1] - 1
			dic[person1, default: []].insert(person2)
			dic[person2, default: []].insert(person1)
		}
		var people: [Bool?] = Array(repeating: nil, count: n)
		while true {
			var notDecided: Int?
			for (i, person) in people.enumerated() {
				if person == nil {
					notDecided = i
					break
				}
			}
			if let notDecided = notDecided {
				var queue = [notDecided]
				people[notDecided] = true
				while !queue.isEmpty {
					let person1 = queue.removeFirst()
					let person1Group = people[person1]!
					let peoplePerson1Dislike = dic[person1, default: []]
					for person2 in peoplePerson1Dislike {
						if let person2Group = people[person2] {
							if person1Group == person2Group {
								return false
							}
						} else {
							people[person2] = !person1Group
							queue.append(person2)
						}
					}
				}
			} else {
				return true
			}
		}
	}
}
