let sn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let s = sn[0], n = sn[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.max
for i in 0..<s {
    for j in 0..<s where i != j {
        let sum = (0..<s)
            .filter { $0 != i && $0 != j }
            .reduce(0) { $0 + arr[$1] }
        let diff = abs(n - sum)
        result = min(result, diff)
    }
}

print(result)