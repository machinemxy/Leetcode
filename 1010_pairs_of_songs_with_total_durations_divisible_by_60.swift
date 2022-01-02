// https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
// Basically a variation of 0001_two_sum

class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        guard time.count > 1 else { return 0 }
        var equals0 = 0
        var equals30 = 0
        var dicOver30 = Dictionary<Int, Int>()
        var arrayBelow30 = [Int]()

        for song in time {
            let restTime = song % 60
            if restTime == 0 {
                equals0 += 1
            } else if restTime == 30 {
                equals30 += 1
            } else if restTime < 30 {
                arrayBelow30.append(restTime)
            } else {
                dicOver30[restTime] = (dicOver30[restTime] ?? 0) + 1
            }
        }

        var sumPlusByOneUnder30AndAnotherOver30 = 0
        for song in arrayBelow30 {
            let anotherSong = 60 - song
            sumPlusByOneUnder30AndAnotherOver30 += (dicOver30[anotherSong] ?? 0)
        }

        return sumPlusByOneUnder30AndAnotherOver30 + calcPatterns(group: equals0) + calcPatterns(group: equals30)
    }

    private func calcPatterns(group: Int) -> Int {
        guard group > 1 else { return 0 }
        return group - 1 + calcPatterns(group: group - 1)
    }
}
