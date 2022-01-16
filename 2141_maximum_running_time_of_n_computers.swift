// https://leetcode.com/problems/maximum-running-time-of-n-computers/

class Solution {
    var batteries = [Int]()
    var n = 0

    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        self.batteries = batteries
        self.n = n
        let allBatteriesLife = batteries.reduce(0) { $0 + $1 }
        let theoreticallyMaxRunTime = allBatteriesLife / n
        var maxRunTime = 0

        var l = 0
        var r = theoreticallyMaxRunTime
        var i = (l + r) / 2
        while l <= r {
            if isPossibleToRun(minutes: i) {
                maxRunTime = i
                l = i + 1
            } else {
                r = i - 1
            }
            i = (l + r) / 2
        }

        return maxRunTime
    }

    private func isPossibleToRun(minutes: Int) -> Bool {
        let batteriesCanUse = batteries.reduce(0) { $0 + min(minutes, $1) }
        return batteriesCanUse >= (minutes * n)
    }
}
