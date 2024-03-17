let nb = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nb[0], b = nb[1]
var arr: [(p: Int, s: Int)] = [] 
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var result = 0
for i in 0..<n {
    var costs: [Int] = (0..<n).map { 
        if $0 == i {
            return arr[$0].p / 2 + arr[$0].s
        } else {
            return arr[$0].p + arr[$0].s
        }
    }
    costs.sort(by: <)

    var count = 0, tmp = b
    for j in 0..<n where tmp >= costs[j] {
        tmp -= costs[j]
        count += 1
    }

    result = max(result, count)
}

print(result)