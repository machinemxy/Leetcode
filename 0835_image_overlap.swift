// https://leetcode.com/problems/image-overlap/

class Solution {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        let length = img1.count
        let diff = length - 1
        var result = 0
        for yDiff in -diff...diff {
            for xDiff in -diff...diff {
                var overlap = 0
                for y in 0..<length {
                    let y2 = y + yDiff
                    if y2 < 0 { continue }
                    if y2 >= length { break }
                    for x in 0..<length {
                        let x2 = x + xDiff
                        if x2 < 0 { continue }
                        if x2 >= length { break }
                        if img1[y][x] == 1 && img2[y2][x2] == 1 {
                            overlap += 1
                        }
                    }
                }
                result = max(result, overlap)
            }
        }
        return result
    }
}
