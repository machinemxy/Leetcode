// https://leetcode.com/problems/integer-to-english-words/description/

class Solution {
    private val belowTen = arrayOf("Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
    private val belowTwenty = arrayOf("Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen")
    private val belowHundred = arrayOf("", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety")

    fun numberToWords(num: Int): String {
        if (num < 10) {
            return belowTen[num]
        } else if (num < 20) {
            return belowTwenty[num - 10]
        } else if (num < 100) {
            val shiwei = num / 10
            val gewei = num % 10
            if (gewei == 0) {
                return belowHundred[shiwei]
            } else {
                return "${belowHundred[shiwei]} ${belowTen[gewei]}"
            }
        } else if (num < 1000) {
            val baiwei = num / 100
            val rest = num % 100
            if (rest == 0) {
                return "${belowTen[baiwei]} Hundred"
            } else {
                val restStr = numberToWords(rest)
                return "${belowTen[baiwei]} Hundred $restStr"
            }
        } else if (num < 1000000) {
            val qianwei = num / 1000
            val rest = num % 1000
            val qianweiStr = numberToWords(qianwei)
            if (rest == 0) {
                return "$qianweiStr Thousand"
            } else {
                val restStr = numberToWords(rest)
                return "$qianweiStr Thousand $restStr"
            }
        } else if (num < 1000000000) {
            val baiwanwei = num / 1000000
            val rest = num % 1000000
            val baiwanweiStr = numberToWords(baiwanwei)
            if (rest == 0) {
                return "$baiwanweiStr Million"
            } else {
                val restStr = numberToWords(rest)
                return "$baiwanweiStr Million $restStr"
            }
        } else {
            val shiyiwei = num / 1000000000
            val rest = num % 1000000000
            val shiyiweiStr = numberToWords(shiyiwei)
            if (rest == 0) {
                return "$shiyiweiStr Billion"
            } else {
                val restStr = numberToWords(rest)
                return "$shiyiweiStr Billion $restStr"
            }
        }
    }
}
