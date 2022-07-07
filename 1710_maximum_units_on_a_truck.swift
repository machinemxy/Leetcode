// https://leetcode.com/problems/maximum-units-on-a-truck/

class Solution {
	func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
		let boxTypes = boxTypes.sorted { $0[1] >= $1[1] }
		var restSpace = truckSize
		var units = 0
		for boxType in boxTypes {
			if boxType[0] < restSpace {
				restSpace -= boxType[0]
				units += boxType[0] * boxType[1]
			} else {
				units += restSpace * boxType[1]
				break
			}
		}
		return units
	}
}
