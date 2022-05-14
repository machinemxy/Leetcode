// https://leetcode.com/problems/network-delay-time/

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        // init nodes
        var nodes = [Node]()
        for _ in 1...n {
            nodes.append(Node())
        }

        // set possible send routes
        for time in times {
            let sendNodeId = time[0] - 1
            let receiveNodeId = time[1] - 1
            let transmitTime = time[2]

            nodes[sendNodeId].sends.append(Send(receiveNodeId: receiveNodeId, transmitTime: transmitTime))
        }

        // Dijkastras
        nodes[k - 1].bestTime = 0

        while true {
            var nextNodeId = -1
            var fastest = Int.max
            for i in 0..<nodes.count where !nodes[i].bestTimeComfirmed {
                if nodes[i].bestTime < fastest {
                    fastest = nodes[i].bestTime
                    nextNodeId = i
                }
            }

            if nextNodeId == -1 {
                break
            }

            let sendNode = nodes[nextNodeId]
            sendNode.bestTimeComfirmed = true
            for send in sendNode.sends {
                let receiveNode = nodes[send.receiveNodeId]
                if receiveNode.bestTimeComfirmed { continue }
                let timeIfSendByThisNode = sendNode.bestTime + send.transmitTime
                if timeIfSendByThisNode < receiveNode.bestTime {
                    receiveNode.bestTime = timeIfSendByThisNode
                }
            }
        }

        // get longest time
        var longestTime = 0
        for node in nodes {
            if node.bestTimeComfirmed == false {
                return -1
            } else {
                longestTime = max(longestTime, node.bestTime)
            }
        }
        return longestTime
    }
}

fileprivate class Node {
    var sends = [Send]()
    var bestTimeComfirmed = false
    var bestTime = Int.max
}

fileprivate struct Send {
    var receiveNodeId: Int
    var transmitTime: Int
}
