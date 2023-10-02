// https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color/

class Solution {
    fun winnerOfGame(colors: String): Boolean {
        var aTurns = 0
        var bTurns = 0
        var prevIsA = true
        var rowCount = 0
        for (color in colors) {
            if (color == 'A') {
                if (prevIsA) {
                    rowCount++
                } else {
                    bTurns += getTurns(rowCount)
                    prevIsA = true
                    rowCount = 1
                }
            } else {
                if (prevIsA) {
                    aTurns += getTurns(rowCount)
                    prevIsA = false
                    rowCount = 1
                } else {
                    rowCount++
                }
            }
        }
        if (prevIsA) {
            aTurns += getTurns(rowCount)
        } else {
            bTurns += getTurns(rowCount)
        }
        return aTurns > bTurns
    }

    private fun getTurns(count: Int): Int {
        if (count <= 2) {
            return 0
        } else {
            return count - 2
        }
    }
}
