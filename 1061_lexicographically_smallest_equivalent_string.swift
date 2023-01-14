// https://leetcode.com/problems/lexicographically-smallest-equivalent-string/description/

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let a1 = Array(s1)
        let a2 = Array(s2)
        var dic = [Character: Group]()
        for c in "abcdefghijklmnopqrstuvwxyz" {
            dic[c] = Group(char: c)
        }
        for i in 0..<a1.count {
            let c1 = a1[i]
            let c2 = a2[i]
            let g1 = dic[c1]!
            let g2 = dic[c2]!
            guard g1 !== g2 else { continue }
            if g1.smallestChar < g2.smallestChar {
                for c in g2.chars {
                    g1.chars.insert(c)
                    dic[c] = g1
                }
            } else {
                for c in g1.chars {
                    g2.chars.insert(c)
                    dic[c] = g2
                }
            }
        }
        return baseStr.reduce("") { partialResult, c in
            var r = partialResult
            r.append(dic[c]!.smallestChar)
            return r
        }
    }
}

class Group {
    var chars: Set<Character>
    var smallestChar: Character
    
    init(char: Character) {
        chars = [char]
        smallestChar = char
    }
}
