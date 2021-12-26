// https://leetcode.com/problems/k-closest-points-to-origin/

class Solution {
    struct PointAndDistance {
        let point: [Int]
        let distance: Int

        init(point: [Int]) {
            self.point = point
            let x = point[0]
            let y = point[1]
            // seems no need to sqrt
            distance = x * x + y * y
        }
    }
    
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var array = [PointAndDistance]()

        for point in points {
            let pad = PointAndDistance(point: point)
            var inserted = false
            for i in 0..<array.count {
                if pad.distance < array[i].distance {
                    array.insert(pad, at: i)
                    inserted = true
                    break
                }
            }
            if !inserted {
                array.append(pad)
            }
        }

        return array[0..<k].map({ $0.point })
    }
}
