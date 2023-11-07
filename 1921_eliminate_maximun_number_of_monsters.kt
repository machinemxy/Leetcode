// https://leetcode.com/problems/eliminate-maximum-number-of-monsters/description/

class Solution {
    fun eliminateMaximum(dist: IntArray, speed: IntArray): Int {
        val monsters = mutableListOf<Int>()
        for (i in dist.indices) {
            val thisDist = dist[i]
            val thisSpeed = speed[i]
            if (thisDist % thisSpeed == 0) {
                monsters.add(thisDist / thisSpeed)
            } else {
                monsters.add(thisDist / thisSpeed + 1)
            }
        }
        monsters.sort()
        var count = 0
        var currentTime = 0
        while (monsters.isNotEmpty()) {
            val firstMonster = monsters[0]
            val timeUntilFirstMonsterCome = firstMonster - currentTime
            currentTime = firstMonster
            if (timeUntilFirstMonsterCome <= 0) {
                break
            }
            if (timeUntilFirstMonsterCome >= monsters.size) {
                count += monsters.size
                break
            }
            for (i in 0 until timeUntilFirstMonsterCome) {
                monsters.removeAt(0)
            }
            count += timeUntilFirstMonsterCome
        }
        return count
    }
}
