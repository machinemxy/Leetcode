// https://leetcode.com/problems/interleaving-string/

class Solution {
    private var a1 = [Character]()
    private var a2 = [Character]()
    private var a3 = [Character]()
    private var cache = Dictionary<IntPair, Bool>()

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        a1 = Array(s1)
        a2 = Array(s2)
        a3 = Array(s3)

        guard a1.count + a2.count == a3.count else {
            return false
        }

        return isInterleave(int1: 0, int2: 0)
    }

    private func isInterleave(int1: Int, int2: Int) -> Bool {
        if int1 + int2 == a3.count { return true }
        let intPair = IntPair(int1: int1, int2: int2)
        if let cacheResult = cache[intPair] {
            return cacheResult
        }

        if int1 < a1.count && a1[int1] == a3[int1 + int2] {
            let result1 = isInterleave(int1: int1 + 1, int2: int2)
            if result1 {
                cache[intPair] = true
                return true
            }
        }

        if int2 < a2.count && a2[int2] == a3[int1 + int2] {
            let result2 = isInterleave(int1: int1, int2: int2 + 1)
            if result2 {
                cache[intPair] = true
                return true
            }
        }

        cache[intPair] = false
        return false
    }
}

fileprivate struct IntPair: Hashable {
    var int1: Int
    var int2: Int
}
