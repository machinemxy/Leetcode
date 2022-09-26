// https://leetcode.com/problems/satisfiability-of-equality-equations/

class Solution {
	func equationsPossible(_ equations: [String]) -> Bool {
		var relationshipDic = Dictionary<Character, Relationship>()
		for c in "abcdefghijklmnopqrstuvwxyz" {
			relationshipDic[c] = Relationship()
		}

		for equation in equations.map({ Array($0) }) {
			let c1 = equation[0]
			let c2 = equation[3]
			let relationship1 = relationshipDic[c1]!
			let relationship2 = relationshipDic[c2]!
			if equation[1] == "=" {
				// equal
				guard relationship1 !== relationship2 else { continue }
				if relationship1.unequals.contains(relationship2) {
					return false
				}
				// merge two relationships
				relationship1.unequals = relationship1.unequals.union(relationship2.unequals)
				for c in "abcdefghijklmnopqrstuvwxyz" {
					if relationshipDic[c] === relationship2 {
						relationshipDic[c] = relationship1
					}
				}
				for relationship in relationshipDic.values {
					if relationship.unequals.contains(relationship2) {
						relationship.unequals.remove(relationship2)
						relationship.unequals.insert(relationship1)
					}
				}
			} else {
				// unequal
				if relationship1 === relationship2 { return false }
				relationship1.unequals.insert(relationship2)
				relationship2.unequals.insert(relationship1)
			}
		}

		return true
	}
}

class Relationship: Hashable {
	static func == (lhs: Relationship, rhs: Relationship) -> Bool {
		lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}

	let id = UUID()
	var unequals: Set<Relationship> = []
}
