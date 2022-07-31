// https://leetcode.com/problems/word-subsets/

class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        let dics1 = words1.map { stringToDic(str: $0) }
        let dics2 = words2.map { stringToDic(str: $0) }
        var unionedDic2 = Dictionary<Character, Int>()
        for dic2 in dics2 {
            for (key, value) in dic2 {
                if let unionedValue2 = unionedDic2[key] {
                    if value > unionedValue2 {
                        unionedDic2[key] = value
                    }
                } else {
                    unionedDic2[key] = value
                }
            }
        }
        var result = [String]()
        for (id, dic1) in dics1.enumerated() {
            if isDic1IncludeDic2(dic1: dic1, dic2: unionedDic2) {
                result.append(words1[id])
            }
        }
        return result
    }

    private func stringToDic(str: String) -> Dictionary<Character, Int> {
        var dic = Dictionary<Character, Int>()
        for c in str {
            dic[c] = dic[c, default: 0] + 1
        }
        return dic
    }

    private func isDic1IncludeDic2(dic1: Dictionary<Character, Int>, dic2: Dictionary<Character, Int>) -> Bool {
        for (key, value) in dic2 {
            if let valueInDic1 = dic1[key] {
                if valueInDic1 < value {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}
