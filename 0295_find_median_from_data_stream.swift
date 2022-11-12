// https://leetcode.com/problems/find-median-from-data-stream/

class MedianFinder {
    var array = [Int]()
    
    init() {}
    
    func addNum(_ num: Int) {
        var l = 0
        var r = array.count - 1
        while l <= r {
            let mid = (l + r) / 2
            let midVal = array[mid]
            if num <= midVal {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        array.insert(num, at: l)
    }
    
    func findMedian() -> Double {
        if array.count % 2 == 0 {
            return Double(array[array.count / 2 - 1] + array[array.count / 2]) / Double(2)
        } else {
            return Double(array[array.count / 2])
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
