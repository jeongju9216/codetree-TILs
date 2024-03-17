let n = Int(readLine()!)!
var arr = readLine()!.map { Int(String($0))! }

var maxDistance = Int.min
var prevPoint = 0
var left = 0, right = 0
for i in 1..<n {
    guard arr[i] == 1 else {
        continue
    }

    let dist = i - prevPoint
    if maxDistance < dist {
        maxDistance = dist
        left = prevPoint
        right = i
    }
    prevPoint = i
}

let center = left + (right - left) / 2
arr[center] = 1

var result = Int.max
prevPoint = 0
for i in 1..<n {
    guard arr[i] == 1 else {
        continue
    }

    let dist = i - prevPoint
    result = min(result, dist)
    prevPoint = i
}

print(result)