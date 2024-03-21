typealias Point = (p: Int, s: Int)

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var points: [Point] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    let p = Int(input[0])!
    points.append((p, input[1] == "G" ? 1 : 2))
}

var result = 0
for i in 0..<n {
    var count = points[i].s
    for j in i..<n {
        guard i != j else { 
            continue
        }

        guard abs(points[i].p - points[j].p) <= k else {
            break
        }

        count += points[j].s
    }
    result = max(result, count)
}
print(result)