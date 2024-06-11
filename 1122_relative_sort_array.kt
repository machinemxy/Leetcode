// https://leetcode.com/problems/relative-sort-array/description/

class Solution {
    fun relativeSortArray(arr1: IntArray, arr2: IntArray): IntArray {
        val map = mutableMapOf<Int, Int>()
        arr2.forEachIndexed { index, i ->
            map[i] = index
        }
        val comparator = Comparator<Int> { l, r ->
            if (map.containsKey(l)) {
                if (map.containsKey(r)) {
                    map.getValue(l) - map.getValue(r)
                } else {
                    -1
                }
            } else {
                if (map.containsKey(r)) {
                    1
                } else {
                    l - r
                }
            }
        }
        return arr1.sortedWith(comparator).toIntArray()
    }
}
