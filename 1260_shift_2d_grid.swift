// https://leetcode.com/problems/shift-2d-grid/

class Solution {
	func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
		let rowLength = grid.first!.count
		var array = [Int]()
		for row in grid {
			array += row
		}

		let moddedK = k % array.count
		if moddedK == 0 {
			return grid
		}

		for _ in 1...moddedK {
			let last = array.removeLast()
			array.insert(last, at: 0)
		}

		var result = [[Int]]()
		var row = [Int]()
		for num in array {
			row.append(num)
			if row.count == rowLength {
				result.append(row)
				row = [Int]()
			}
		}

		return result
	}
}
