// https://leetcode.com/problems/longest-happy-string/description/

class Solution {
    fun longestDiverseString(a: Int, b: Int, c: Int): String {
        val sb = StringBuilder()
        var restA = a
        var restB = b
        var restC = c
        var prevChar = 'a'
        var prevCount = 0
        while (restA + restB + restC > 0) {
            if (prevCount == 2) {
                if (prevChar == 'a') {
                    if (restB + restC == 0) {
                        break
                    } else if (restB >= restC) {
                        sb.append('b')
                        restB--
                        prevChar = 'b'
                        prevCount = 1
                    } else {
                        sb.append('c')
                        restC--
                        prevChar = 'c'
                        prevCount = 1
                    }
                } else if (prevChar == 'b') {
                    if (restA + restC == 0) {
                        break
                    } else if (restA >= restC) {
                        sb.append('a')
                        restA--
                        prevChar = 'a'
                        prevCount = 1
                    } else {
                        sb.append('c')
                        restC--
                        prevChar = 'c'
                        prevCount = 1
                    }
                } else {
                    if (restA + restB == 0) {
                        break
                    } else if (restA >= restB) {
                        sb.append('a')
                        restA--
                        if (prevChar == 'a') {
                            prevCount++
                        } else {
                            prevChar = 'a'
                            prevCount = 1
                        }
                    } else {
                        sb.append('b')
                        restB--
                        if (prevChar == 'b') {
                            prevCount++
                        } else {
                            prevChar = 'b'
                            prevCount = 1
                        }
                    }
                }
            } else if (restA >= restB && restA >= restC) {
                sb.append('a')
                restA--
                if (prevChar == 'a') {
                    prevCount++
                } else {
                    prevChar = 'a'
                    prevCount = 1
                }
            } else if (restB >= restA && restB >= restC) {
                sb.append('b')
                restB--
                if (prevChar == 'b') {
                    prevCount++
                } else {
                    prevChar = 'b'
                    prevCount = 1
                }
            } else {
                sb.append('c')
                restC--
                if (prevChar == 'c') {
                    prevCount++
                } else {
                    prevChar = 'c'
                    prevCount = 1
                }
            }
        }
        return sb.toString()
    }
}
