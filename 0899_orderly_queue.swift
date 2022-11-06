// https://leetcode.com/problems/orderly-queue/

class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        if k > 1 {
            return String(s.sorted())
        } else {
            var best = s
            var tempS = s
            while true {
                let firstChar = tempS.removeFirst()
                tempS.append(firstChar)
                if tempS < best {
                    best = tempS
                }
                if tempS == s {
                    return best
                }
            }
        }
    }
}
