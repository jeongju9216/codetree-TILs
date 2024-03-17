let n = Int(readLine()!)!
var arr: [(s: Int, e: Int)] = []
for _ in 0..<n {
    let se = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((se[0], se[1]))
}

arr.sort { $0.e < $1.e }

var result = 0
var prevEnd = 0
for room in arr {
    if prevEnd <= room.s {
        prevEnd = room.e
    } else {
        result += 1
    }
}
print(result)