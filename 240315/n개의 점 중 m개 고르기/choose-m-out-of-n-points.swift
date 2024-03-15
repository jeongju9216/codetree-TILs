import Foundation

func backtracking(_ arr: [(x: Int, y: Int)], _ index: Int) {
    guard arr.count < m else {
        var dist = 0
        for i in 0..<arr.count {
            for j in 0..<arr.count where i != j {
                let x = Int(pow(Double(arr[i].x - arr[j].x), 2.0))
                let y = Int(pow(Double(arr[i].y - arr[j].y), 2.0))
                dist = max(dist, x + y)
            }
        }
        result = min(result, dist)
        return
    }

    if index > points.count {
        return
    }

    for i in index..<n {
        backtracking(arr + [points[i]], i + 1)
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var points: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    points.append((xy[0], xy[1]))
}

var result = Int.max
backtracking([], 0)
print(result)