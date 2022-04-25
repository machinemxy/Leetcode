// https://leetcode.com/problems/peeking-iterator/

// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
	private var arr: IndexingIterator<Array<Int>>

	init(_ arr: IndexingIterator<Array<Int>>) {
		self.arr = arr
	}

	func next() -> Int {
		arr.next()!
	}

	func peek() -> Int {
		var copy = arr
		return copy.next()!
	}

	func hasNext() -> Bool {
		var copy = arr
		return copy.next() != nil
	}
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */
