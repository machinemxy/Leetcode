// https://leetcode.com/problems/asteroid-collision/description/

import kotlin.math.abs

class Solution {
    fun asteroidCollision(asteroids: IntArray): IntArray {
        val result = ArrayDeque<Int>()
        for (asteroid in asteroids) {
            collide(asteroid, result)
        }
        return result.toIntArray()
    }

    private fun collide(asteroid: Int, previous: ArrayDeque<Int>) {
        if (asteroid > 0) {
            previous.add(asteroid)
        } else {
            while (previous.isNotEmpty()) {
                val last = previous.last()
                if (last < 0) {
                    previous.add(asteroid)
                    return
                } else {
                    if (last > -asteroid) {
                        return
                    } else if (last < -asteroid) {
                        previous.removeLast()
                    } else {
                        previous.removeLast()
                        return
                    }
                }
            }
            previous.add(asteroid)
        }
    }
}
