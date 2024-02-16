// https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/description/

class Solution {
    fun findLeastNumOfUniqueInts(arr: IntArray, k: Int): Int {
        val map = mutableMapOf<Int, Int>()
        for (num in arr) {
            map[num] = map.getOrDefault(num, 0) + 1
        }
        val list = map.values.toList().sorted().toMutableList()
        var restK = k
        while (restK > 0) {
            val first = list[0]
            if (restK < first) {
                break
            } else {
                restK -= first
                list.removeFirst()
            }
        }
        return list.size
    }
}
