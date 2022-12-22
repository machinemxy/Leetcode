// https://leetcode.com/problems/sum-of-distances-in-tree/description/

class Solution {
	var connections = [Set<Int>]()
	var nodesCount = [Int]()
	var subResults = [Int]()
	var results = [Int]()
	var n = 0

	func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
		connections = Array(repeating: Set<Int>(), count: n)
		for edge in edges {
			let point1 = edge[0]
			let point2 = edge[1]
			connections[point1].insert(point2)
			connections[point2].insert(point1)
		}
		nodesCount = Array(repeating: 1, count: n)
		subResults = Array(repeating: 0, count: n)
		results = Array(repeating: 0, count: n)
		self.n = n
		calcSubResults(point: 0, exclusive: -1)
		results[0] = subResults[0]
		calcResults(point: 0, exclusive: -1)
		return results
	}

	func calcSubResults(point: Int, exclusive: Int) {
		for connectedPoint in connections[point] where connectedPoint != exclusive {
			calcSubResults(point: connectedPoint, exclusive: point)
			nodesCount[point] += nodesCount[connectedPoint]
			subResults[point] += (subResults[connectedPoint] + nodesCount[connectedPoint])
		}
	}

	func calcResults(point: Int, exclusive: Int) {
		for connectedPoint in connections[point] where connectedPoint != exclusive {
			results[connectedPoint] = results[point] - nodesCount[connectedPoint] + (n - nodesCount[connectedPoint])
			calcResults(point: connectedPoint, exclusive: point)
		}
	}
}
