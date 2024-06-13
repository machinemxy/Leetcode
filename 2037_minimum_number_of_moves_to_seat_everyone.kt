// https://leetcode.com/problems/minimum-number-of-moves-to-seat-everyone/description/

import kotlin.math.abs

class Solution {
    fun minMovesToSeat(seats: IntArray, students: IntArray): Int {
        seats.sort()
        students.sort()
        var result = 0
        for (i in seats.indices) {
            result += abs(seats[i] - students[i])
        }
        return result
    }
}
