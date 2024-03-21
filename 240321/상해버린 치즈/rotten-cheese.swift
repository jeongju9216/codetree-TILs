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
    var isOkay = true
    // i 치즈가 상했을 때 모든 기록에 모순이 없는지 확인
    for record in records {
        // record의 사람이 i 치즈를 t 시간 전에 먹은 정보
        let info = infoList.filter { $0.p == record.p && $0.m == i && $0.t < record.t }
        // 해당하는 내용이 없으면 모순
        if info.isEmpty {
            isOkay = false
            break
        }
    }

    // 모든 record와 비교했을 때 모순이 없음
    if isOkay {
        // i 치즈는 상한 치즈일 수 있음 -> i 치즈를 먹은 사람 개수 -> 약의 개수
        let ateCheesePerson = infoList.filter { $0.m == i }.count
        result = max(result, ateCheesePerson)
    }
}
print(result)