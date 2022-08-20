// https://leetcode.com/problems/minimum-number-of-refueling-stops/

class Solution {
	var avaiableFuels = [Int]()

	func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
		var fuel = startFuel
		var stationsVisited = 0
		var stationId = 0


		while true {
			if fuel >= target { return stationsVisited }

			while stationId < stations.count && stations[stationId][0] <= fuel {
				insertAvailableFuel(fuel: stations[stationId][1])
				stationId += 1
			}

			if avaiableFuels.isEmpty {
				return -1
			} else {
				let addedFuel = avaiableFuels.removeLast()
				fuel += addedFuel
				stationsVisited += 1
			}
		}
	}

	func insertAvailableFuel(fuel: Int) {
		if avaiableFuels.isEmpty {
			avaiableFuels.append(fuel)
		} else {
			var l = 0
			var r = avaiableFuels.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midVal = avaiableFuels[mid]
				if fuel <= midVal {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
			avaiableFuels.insert(fuel, at: l)
		}
	}
}
