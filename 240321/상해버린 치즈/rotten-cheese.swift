typealias Info = (p: Int, m: Int, t: Int)
typealias Record = (p: Int, t: Int)

let nmds = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nmds[0], m = nmds[1], d = nmds[2], s = nmds[3]
var infoList: [Info] = []
for _ in 0..<d {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    infoList.append((input[0], input[1], input[2]))
}
var records: [Record] = []
for _ in 0..<s {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    records.append((input[0], input[1]))
}

// 치즈가 상할 가능성이 있는지 판단
var result = 0
for i in 1...m {
    var time = Array(repeating: Int.max, count: 50 + 1)
    for info in infoList {
        guard info.m == i else {
            continue
        }

        time[info.p] = min(time[info.p], info.t)
    }

    var isPossible = true
    for record in records {
        if time[record.p] >= record.t {
            // 안 먹거나
            // 아픈 시간보다 같거나 늦게 먹은 경우
            isPossible = false
        }
    }

    if isPossible {
        let count = time.filter { $0 < Int.max }.count
        result = max(result, count)
    }
}
print(result)