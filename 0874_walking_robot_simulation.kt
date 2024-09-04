// https://leetcode.com/problems/walking-robot-simulation/description/

import kotlin.math.max

class Solution {
    fun robotSim(commands: IntArray, obstacles: Array<IntArray>): Int {
        val obstacleSet = mutableSetOf<Point>()
        var direction = Direction.UP
        var currentY = 0
        var currentX = 0
        var furthest = 0
        for (obstacle in obstacles) {
            obstacleSet.add(Point(obstacle[1], obstacle[0]))
        }
        for (command in commands) {
            if (command == -2) {
                direction = when (direction) {
                    Direction.UP -> Direction.LEFT
                    Direction.DOWN -> Direction.RIGHT
                    Direction.LEFT -> Direction.DOWN
                    Direction.RIGHT -> Direction.UP
                }
            } else if (command == -1) {
                direction = when (direction) {
                    Direction.UP -> Direction.RIGHT
                    Direction.DOWN -> Direction.LEFT
                    Direction.LEFT -> Direction.UP
                    Direction.RIGHT -> Direction.DOWN
                }
            } else {
                when (direction) {
                    Direction.UP -> {
                        for (i in 1 .. command) {
                            if (obstacleSet.contains(Point(currentY + 1, currentX))) {
                                break
                            } else {
                                currentY++
                            }
                        }
                        furthest = max(furthest, currentX * currentX + currentY * currentY)
                    }
                    Direction.DOWN -> {
                        for (i in 1 .. command) {
                            if (obstacleSet.contains(Point(currentY - 1, currentX))) {
                                break
                            } else {
                                currentY--
                            }
                        }
                        furthest = max(furthest, currentX * currentX + currentY * currentY)
                    }
                    Direction.LEFT -> {
                        for (i in 1 .. command) {
                            if (obstacleSet.contains(Point(currentY, currentX - 1))) {
                                break
                            } else {
                                currentX--
                            }
                        }
                        furthest = max(furthest, currentX * currentX + currentY * currentY)
                    }
                    Direction.RIGHT -> {
                        for (i in 1 .. command) {
                            if (obstacleSet.contains(Point(currentY, currentX + 1))) {
                                break
                            } else {
                                currentX++
                            }
                        }
                        furthest = max(furthest, currentX * currentX + currentY * currentY)
                    }
                }
            }
        }
        return furthest
    }
}

enum class Direction {
    UP, DOWN, LEFT, RIGHT
}

data class Point(
    val y: Int,
    val x: Int
)
