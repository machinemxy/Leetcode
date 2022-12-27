// https://leetcode.com/problems/maximum-bags-with-full-capacity-of-rocks/description/

class Solution {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        let remainedCapacities = capacity.indices.map({ capacity[$0] - rocks[$0] }).sorted()
        var i = 0
        var additionalRocks = additionalRocks
        while i < capacity.count && additionalRocks > 0 {
            let remainedCapacity = remainedCapacities[i]
            if remainedCapacity > additionalRocks {
                return i
            } else {
                additionalRocks -= remainedCapacity
                i += 1
            }
        }
        return i
    }
}
