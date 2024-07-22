// https://leetcode.com/problems/sort-the-people/description/

class Solution {
    fun sortPeople(names: Array<String>, heights: IntArray): Array<String> {
        val map = mutableMapOf<Int, String>()
        for (i in names.indices) {
            map[heights[i]] = names[i]
        }
        heights.sort()
        heights.reverse()
        return heights.map { 
            map.getValue(it)
        }.toTypedArray()
    }
}
