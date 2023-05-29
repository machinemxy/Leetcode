// https://leetcode.com/problems/design-parking-system/description/

class ParkingSystem(var big: Int, var medium: Int, var small: Int) {
    fun addCar(carType: Int): Boolean {
        when (carType) {
            1 ->
                if (big == 0) {
                    return false
                } else {
                    big -= 1
                    return true
                }
            2 ->
                if (medium == 0) {
                    return false
                } else {
                    medium -= 1
                    return true
                }
            else ->
                if (small == 0) {
                    return false
                } else {
                    small -= 1
                    return true
                }
        }
    }
}
