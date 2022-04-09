// https://leetcode.com/problems/top-k-frequent-elements/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencyDic = Dictionary<Int, Int>()
        for num in nums {
            frequencyDic[num] = (frequencyDic[num] ?? 0) + 1
        }

        var rank = [Int]()
        for (num, frequency) in frequencyDic {
            if rank.count == 0 {
                rank.append(num)
            } else {
                if frequency >= frequencyDic[rank.first!]! {
                    rank.insert(num, at: 0)
                } else if frequency <= frequencyDic[rank.last!]! {
                    rank.append(num)
                } else {
                    var l = 0
                    var r = rank.count - 1
                    while l <= r {
                        let mid = (l + r) / 2
                        let midFrequency = frequencyDic[rank[mid]]!
                        if frequency == midFrequency {
                            l = mid
                            r = mid - 1
                        } else if frequency > midFrequency {
                            r = mid - 1
                        } else {
                            l = mid + 1
                        }
                    }
                    rank.insert(num, at: l)
                }

                if rank.count > k {
                    rank.removeLast()
                }
            }
        }

        return rank
    }
}
