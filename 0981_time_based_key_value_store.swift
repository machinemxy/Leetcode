// https://leetcode.com/problems/time-based-key-value-store/

class TimeMap {
	var timeStampDic = Dictionary<String, [Int]>()
	var valueDic = Dictionary<Int, String>()

	init() {}

	func set(_ key: String, _ value: String, _ timestamp: Int) {
		var timeStamps = timeStampDic[key] ?? []
		timeStamps.append(timestamp)
		timeStampDic[key] = timeStamps
		valueDic[timestamp] = value
	}

	func get(_ key: String, _ timestamp: Int) -> String {
		guard let timeStamps = timeStampDic[key] else { return "" }
		var l = 0
		var r = timeStamps.count - 1
		while l <= r {
			let mid = (l + r) / 2
			let midVal = timeStamps[mid]
			if timestamp == midVal {
				r = mid
				break
			} else if timestamp < midVal {
				r = mid - 1
			} else {
				l = mid + 1
			}
		}
		guard r >= 0 else { return "" }
		let latestTimeStamp = timeStamps[r]
		return valueDic[latestTimeStamp]!
	}
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */
