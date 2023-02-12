// https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital/description/

class Solution {
    var seats = 0
    var result = 0
    var roadDic = [Int: Set<Int>]()
    
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        self.seats = seats
        for road in roads {
            roadDic[road[0], default: []].insert(road[1])
            roadDic[road[1], default: []].insert(road[0])
        }
        checkPassengers(node: 0, parent: -1)
        return result
    }
    
    func checkPassengers(node: Int, parent: Int) -> Int {
        var passengers = 1
        for child in roadDic[node, default: []] where child != parent {
            let childPassengers = checkPassengers(node: child, parent: node)
            passengers += childPassengers
        }
        if parent != -1 {
            if passengers % seats == 0 {
                result += passengers / seats
            } else {
                result += (passengers / seats + 1)
            }
        }
        return passengers
    }
}
