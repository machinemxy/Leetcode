// https://leetcode.com/problems/my-calendar-iii/

class MyCalendarThree {
    var timeLine = [Int]()
    
    init() {}
    
    func book(_ start: Int, _ end: Int) -> Int {
        insertToTimeLine(value: start, isStart: true)
        insertToTimeLine(value: end, isStart: false)
        var maxBooking = 0
        var booking = 0
        for time in timeLine {
            if time >= 0 {
                booking += 1
                maxBooking = max(maxBooking, booking)
            } else {
                booking -= 1
            }
        }
        return maxBooking
    }
    
    func insertToTimeLine(value: Int, isStart: Bool) {
        var l = 0
        var r = timeLine.count - 1
        while l <= r {
            let mid = (l + r) / 2
            let midVal = timeLine[mid]
            let absMidVal = abs(midVal)
            if value == absMidVal {
                if isStart && midVal < 0 {
                    // a start should be after an end
                    l = mid + 1
                } else if !isStart && midVal >= 0 {
                    // an end should be before a start
                    r = mid - 1
                } else {
                    l = mid
                    break
                }
            } else if value < absMidVal {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        timeLine.insert(isStart ? value : -value, at: l)
    }
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * let obj = MyCalendarThree()
 * let ret_1: Int = obj.book(start, end)
 */
