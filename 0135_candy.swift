// https://leetcode.com/problems/candy/

class Solution {
	func candy(_ ratings: [Int]) -> Int {
		var candies = Array(repeating: 0, count: ratings.count)

		for i in ratings.indices {
			// If current rating is greater than next rating, skip it
			if (i + 1) < ratings.count && ratings[i] > ratings[i + 1] {
				continue
			}

			if i == 0 {
				candies[i] = 1
			} else if ratings[i] > ratings[i - 1] {
				candies[i] = candies[i - 1] + 1
			} else {
				candies[i] = 1
				// now it's time to calculate the skipped ones
				var j = i - 1
				while j >= 0 && ratings[j] > ratings[j + 1] {
					if j == 0 || ratings[j] <= ratings[j - 1] {
						candies[j] = candies[j + 1] + 1
					} else {
						candies[j] = max(candies[j - 1], candies[j + 1]) + 1
					}
					j -= 1
				}
			}
		}

		return candies.reduce(0, +)
	}
}
