// https://leetcode.com/problems/reducing-dishes/description/

class Solution {
    fun maxSatisfaction(satisfaction: IntArray): Int {
        satisfaction.sortDescending()
        var sum = 0
        var i = 0
        while (i < satisfaction.size) {
            val dish = satisfaction[i]
            sum += dish
            if (sum <= 0) {
                break
            }
            i++
        }
        val dishes = satisfaction.sliceArray(0 until i).reversedArray()
        var result = 0
        dishes.forEachIndexed { j, dish ->
            result += (j + 1) * dish
        }
        return result
    }
}
