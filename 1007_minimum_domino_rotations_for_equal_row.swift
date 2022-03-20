// https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/

class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        var dic = Dictionary<Int, Int>()
        var topDic = Dictionary<Int, Int>()
        var bottomDic = Dictionary<Int, Int>()

        for i in 0..<tops.count {
            let top = tops[i]
            let bottom = bottoms[i]
            if top == bottom {
                dic[top] = (dic[top] ?? 0) + 1
            } else {
                dic[top] = (dic[top] ?? 0) + 1
                dic[bottom] = (dic[bottom] ?? 0) + 1
            }
            topDic[top] = (topDic[top] ?? 0) + 1
            bottomDic[bottom] = (bottomDic[bottom] ?? 0) + 1
        }

        var target = 0
        for (key, value) in dic {
            if value == tops.count {
                target = key
                break
            }
        }

        if target == 0 {
            return -1
        }

        let maxCount = max(topDic[target]!, bottomDic[target]!)
        return tops.count - maxCount
    }
}
