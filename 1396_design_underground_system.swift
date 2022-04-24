// https://leetcode.com/problems/design-underground-system/

class UndergroundSystem {
    struct FromTo: Hashable {
        let from: String
        let to: String
    }

    struct History {
        let duration: Int
        let times: Int
    }

    struct StartStationAndTime {
        let station: String
        let time: Int
    }

    var idDic = Dictionary<Int, StartStationAndTime>()
    var historyDic = Dictionary<FromTo, History>()

    init() {

    }

    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        idDic[id] = StartStationAndTime(station: stationName, time: t)
    }

    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let startStationAndTime = idDic[id]!
        if let history = historyDic[FromTo(from: startStationAndTime.station, to: stationName)] {
            historyDic[FromTo(from: startStationAndTime.station, to: stationName)] = History(duration: t - startStationAndTime.time + history.duration, times: 1 + history.times)
        } else {
            historyDic[FromTo(from: startStationAndTime.station, to: stationName)] = History(duration: t - startStationAndTime.time, times: 1)
        }
    }

    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let history = historyDic[FromTo(from: startStation, to: endStation)]!
        return Double(history.duration) / Double(history.times)
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */
