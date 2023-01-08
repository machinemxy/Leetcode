// https://leetcode.com/problems/max-points-on-a-line/description/

class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else { return 1 }
        
        // y = ax + b
        var dic = [AB: Set<Int>]()
        for i in 0..<(points.count - 1) {
            for j in (i + 1)..<points.count {
                let p1 = points[i]
                let p2 = points[j]
                if p1[0] == p2[0] {
                    let ab = AB(a: Float.greatestFiniteMagnitude, b: Float(p1[0]))
                    dic[ab, default: []].insert(i)
                    dic[ab, default: []].insert(j)
                } else {
                    let a = (Float(p2[1]) - Float(p1[1])) / (Float(p2[0]) - Float(p1[0]))
                    let b = Float(p1[1]) - a * Float(p1[0])
                    let ab = AB(a: a, b: b)
                    dic[ab, default: []].insert(i)
                    dic[ab, default: []].insert(j)
                }
            }
        }
        
        var result = 0
        for set in dic.values {
            result = max(result, set.count)
        }
        return result
    }
}

struct AB: Hashable {
    let a: Float
    let b: Float
}
