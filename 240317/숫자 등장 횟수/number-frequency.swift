let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let nums = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dict: [Int: Int] = [:]
for num in arr {
    dict[num, default: 0] += 1
}

for num in nums {
    print(dict[num] ?? 0, terminator: " ")
}