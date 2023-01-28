// https://leetcode.com/problems/data-stream-as-disjoint-intervals/description/

class SummaryRanges {
    var starts = Set<Int>()
    var ends = Set<Int>()
    var values = Set<Int>()
    var cachedResult = [[Int]]()
    
    init() {}
    
    func addNum(_ value: Int) {
        guard !values.contains(value) else { return }
        cachedResult = []
        values.insert(value)
        if ends.contains(value - 1) {
            ends.remove(value - 1)
        } else {
            starts.insert(value)
        }
        
        if starts.contains(value + 1) {
            starts.remove(value + 1)
        } else {
            ends.insert(value)
        }
    }
    
    func getIntervals() -> [[Int]] {
        if !cachedResult.isEmpty {
            return cachedResult
        }
        let sortedStarts = starts.sorted()
        let sortedEnds = ends.sorted()
        cachedResult = sortedStarts.enumerated().map { (i, start) in
            [start, sortedEnds[i]]
        }
        return cachedResult
    }
}
