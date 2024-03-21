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

var men: Set<Int> = []
for record in records {
    let cheeses = infoList
    .filter {  $0.p == record.p && $0.t < record.t }
    .map { $0.m }
    
    for info in infoList {
        if cheeses.contains(info.m) {
            men.insert(info.p)
        }
    }
}

print(men.count)