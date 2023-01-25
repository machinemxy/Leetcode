// https://leetcode.com/problems/find-closest-node-to-given-two-nodes/description/

class Solution {
	func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
		guard node1 != node2 else { return node1 }

		var node1 = node1
		var node2 = node2
		var visited1 = [node1: 0]
		var visited2 = [node2: 0]
		var steps = 1

		while node1 != -1 || node2 != -1 {
			var result = -1
			var resultSteps = Int.min

			if node1 != -1 {
				let next = edges[node1]
				if next == -1 {
					node1 = -1
				} else if visited1.keys.contains(next) {
					node1 = -1
				} else if let visited2Steps = visited2[next] {
					result = next
					resultSteps = visited2Steps
				} else {
					visited1[next] = steps
					node1 = next
				}
			}

			if node2 != -1 {
				let next = edges[node2]
				if next == -1 {
					node2 = -1
				} else if visited2.keys.contains(next) {
					node2 = -1
				} else if let visited1Steps = visited1[next] {
					if visited1Steps > resultSteps {
						result = next
					} else if visited1Steps == resultSteps && next < result {
						result = next
					}
				} else {
					visited2[next] = steps
					node2 = next
				}
			}

			if result != -1 {
				return result
			}

			steps += 1
		}

		return -1
	}
}
