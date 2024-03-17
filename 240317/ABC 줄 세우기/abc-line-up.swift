let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { String($0) }

var result = 0
for i in 1..<n {
    var currentIndex = i
    while currentIndex > 0 && arr[currentIndex] < arr[currentIndex-1] {
        arr.swapAt(currentIndex, currentIndex - 1)
        currentIndex -= 1
        result += 1
    }
}
print(result)