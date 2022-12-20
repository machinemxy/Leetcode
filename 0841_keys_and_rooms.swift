// https://leetcode.com/problems/keys-and-rooms/description/

class Solution {
	func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
		var keyGot = Array(repeating: false, count: rooms.count)
		keyGot[0] = true
		var queue = [0]
		while !queue.isEmpty {
			let room = queue.removeFirst()
			let keys = rooms[room]
			for key in keys where !keyGot[key] {
				keyGot[key] = true
				queue.append(key)
			}
		}
		for key in keyGot {
			if !key {
				return false
			}
		}
		return true
	}
}
