// https://leetcode.com/problems/design-hashset/


class MyHashSet {
	private var array = [Int]()

	init() {}

	func add(_ key: Int) {
		if array.count == 0 {
			array.append(key)
			return
		}

		if key < array.first! {
			array.insert(key, at: 0)
		} else if key > array.last! {
			array.append(key)
		} else {
			var l = 0
			var r = array.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midVal = array[mid]
				if key == midVal {
					// already existed
					return
				} else if key < midVal {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
			array.insert(key, at: l)
		}
	}

	func remove(_ key: Int) {
		if array.count == 0 { return }

		if key < array.first! {
			return
		} else if key > array.last! {
			return
		} else {
			var l = 0
			var r = array.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midVal = array[mid]
				if key == midVal {
					array.remove(at: mid)
					return
				} else if key < midVal {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
		}
	}

	func contains(_ key: Int) -> Bool {
		if array.count == 0 { return false }

		if key < array.first! {
			return false
		} else if key > array.last! {
			return false
		} else {
			var l = 0
			var r = array.count - 1
			while l <= r {
				let mid = (l + r) / 2
				let midVal = array[mid]
				if key == midVal {
					return true
				} else if key < midVal {
					r = mid - 1
				} else {
					l = mid + 1
				}
			}
			return false
		}
	}
}


/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
