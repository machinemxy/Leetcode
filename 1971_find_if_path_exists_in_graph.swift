// https://leetcode.com/problems/find-if-path-exists-in-graph/description/

class Solution {
	func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
		guard source != destination else { return true }
		var paths = Array(repeating: Set<Int>(), count: n)
		for edge in edges {
			let vertex1 = edge[0]
			let vertex2 = edge[1]
			paths[vertex1].insert(vertex2)
			paths[vertex2].insert(vertex1)
		}
		var vertexesThatCanReachFromSource = Array(repeating: false, count: n)
		vertexesThatCanReachFromSource[source] = true
		var vertexStack = [source]
		while !vertexStack.isEmpty {
			let vertex = vertexStack.removeFirst()
			for anotherVertex in paths[vertex] {
				if anotherVertex == destination {
					return true
				}
				guard !vertexesThatCanReachFromSource[anotherVertex] else { continue }
				vertexesThatCanReachFromSource[anotherVertex] = true
				vertexStack.append(anotherVertex)
			}
		}
		return false
	}
}
