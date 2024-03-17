let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]

var dict: [String: String] = [:]
for i in 1...n {
    let s = readLine()!
    dict[s] = String(i)
    dict[String(i)] = s
}

for i in 0..<m {
    let s = readLine()!
    print(dict[s]!)
}