// https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/

class Solution {
    fun countStudents(students: IntArray, sandwiches: IntArray): Int {
        var students0 = 0
        var students1 = 0
        for (student in students) {
            if (student == 0) {
                students0++
            } else {
                students1++
            }
        }
        for (i in sandwiches.indices) {
            if (sandwiches[i] == 0) {
                if (students0 == 0) {
                    return sandwiches.size - i
                } else {
                    students0--
                }
            } else {
                if (students1 == 0) {
                    return sandwiches.size - i
                } else {
                    students1--
                }
            }
        }
        return 0
    }
}
