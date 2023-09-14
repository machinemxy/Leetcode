// https://leetcode.com/problems/reconstruct-itinerary/description/

class Solution {
    var memo = [TravelInfo: [String]?]()

    func findItinerary(_ tickets: [[String]]) -> [String] {
        let sortedTickets = tickets.map {
            $0[0] + $0[1]
        }.sorted()
        var fromToDic = [String: [String]]()
        for ticket in sortedTickets {
            let from = String(ticket.prefix(3))
            let to = String(ticket.suffix(3))
            fromToDic[from, default: []].append(to)
        }
        var result = findItinerary(travelInfo: TravelInfo(fromToDic: fromToDic, currentCity: "JFK")) ?? []
        result.insert("JFK", at: 0)
        return result
    }

    func findItinerary(travelInfo: TravelInfo) -> [String]? {
        if let result = memo[travelInfo] {
            return result
        }

        guard let destinations = travelInfo.fromToDic[travelInfo.currentCity] else {
            return nil
        }

        if destinations.count == 1 {
            let destination = destinations[0]
            var newFromToDic = travelInfo.fromToDic
            newFromToDic.removeValue(forKey: travelInfo.currentCity)
            if newFromToDic.isEmpty {
                memo[travelInfo] = [destination]
                return [destination]
            } else if var result = findItinerary(travelInfo: TravelInfo(fromToDic: newFromToDic, currentCity: destination)) {
                result.insert(destination, at: 0)
                memo[travelInfo] = result
                return result
            }
        } else {
            for (i, destination) in destinations.enumerated() {
                var newDestinations = destinations
                newDestinations.remove(at: i)
                var newFromToDic = travelInfo.fromToDic
                newFromToDic[travelInfo.currentCity] = newDestinations
                if var result = findItinerary(travelInfo: TravelInfo(fromToDic: newFromToDic, currentCity: destination)) {
                    result.insert(destination, at: 0)
                    memo[travelInfo] = result
                    return result
                }
            }
        }

        memo[travelInfo] = nil
        return nil
    }
}

struct TravelInfo: Hashable {
    let fromToDic: [String: [String]]
    let currentCity: String
}
