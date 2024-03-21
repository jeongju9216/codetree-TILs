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
// i 치즈를 infoList의 모든 사람이 t 시간 전에 먹었는지 확인한다
var result = 0
for i in 1...m {
    var count = 0
    for record in records {
        let info = infoList.filter { $0.p == record.p }
        for man in info {
            if man.m == i && man.t < record.t {
                count += 1
                break
            }
        }
    }

    // 모든 record와 비교했을 때 모순이 없음
    if count == records.count {
        let ateCheesePerson = infoList.filter { $0.m == i }.count
        result = max(result, ateCheesePerson)
    }
}
print(result)