// https://leetcode.com/problems/sort-an-array/description/

class Solution {
    fun sortArray(nums: IntArray): IntArray {
        val sorter = ArrayList<IntArray>()
        for (num in nums) {
            val array = intArrayOf(num)
            sorter.add(array)
        }
        while (sorter.size > 1) {
            val size = sorter.size
            for (i in 1..(size / 2)) {
                val a1 = sorter.first()
                sorter.removeAt(0)
                val a2 = sorter.first()
                sorter.removeAt(0)
                val newA = merge(a1, a2)
                sorter.add(newA)
            }
            if (size % 2 != 0) {
                val lastA = sorter.first()
                sorter.removeAt(0)
                sorter.add(lastA)
            }
        }
        return sorter.first()
    }

    private fun merge(a1: IntArray, a2: IntArray): IntArray {
        val result = IntArray(a1.size + a2.size)
        var i1 = 0
        var i2 = 0
        while (i1 < a1.size || i2 < a2.size) {
            if (i1 == a1.size) {
                result[i1 + i2] = a2[i2]
                i2++
            } else if(i2 == a2.size) {
                result[i1 + i2] = a1[i1]
                i1++
            } else if (a1[i1] < a2[i2]) {
                result[i1 + i2] = a1[i1]
                i1++
            } else {
                result[i1 + i2] = a2[i2]
                i2++
            }
        }
        return result
    }
}
