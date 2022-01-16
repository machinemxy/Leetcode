// https://leetcode.com/problems/divide-a-string-into-groups-of-size-k/

class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        var result = [String]()
        var temp = ""
        var i = 0
        for c in s {
            i += 1
            temp.append(c)
            if i == k {
                i = 0
                result.append(temp)
                temp = ""
            }
        }
        if temp != "" {
            let fillCount = k - temp.count
            for _ in 1...fillCount {
                temp.append(fill)
            }
            result.append(temp)
        }
        return result
    }
}
