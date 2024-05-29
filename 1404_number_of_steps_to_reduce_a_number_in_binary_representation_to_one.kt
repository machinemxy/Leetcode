// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/description/

class Solution {
    fun numSteps(s: String): Int {
        var l = s.toMutableList()
        var result = 0
        while (!is1(l)) {
            if (l.last() == '1') {
                var i = l.size - 1
                while (true) {
                    if (i < 0) {
                        l.add(0, '1')
                        break
                    } else if (l[i] == '0') {
                        l[i] = '1'
                        break
                    } else {
                        l[i] = '0'
                        i--
                    }
                }
                result++
            }

            l.removeAt(0)
            var has1 = true
            for (i in l.indices) {
                if (l[i] == '0') {
                    if (has1) {
                        l[i] = '1'
                        has1 = false
                    }
                } else {
                    if (!has1) {
                        l[i] = '0'
                        has1 = true
                    }
                }
            }
            result++
        }
        return result
    }

    private fun is1(l: MutableList<Char>): Boolean {
        return l.size == 1 && l[0] == '1'
    }
}
