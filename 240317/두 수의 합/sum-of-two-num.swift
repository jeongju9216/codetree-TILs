let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dict: [Int: [Int]] = [:]
for i in 0..<arr.count {
    dict[arr[i], default: []].append(i)
}

var result = 0
for num in arr {
    let num1 = dict[num] ?? []
    let num2 = dict[m - num] ?? []
    result += num1.count * num2.count

    dict[num] = nil
    dict[m - num] = nil
}
print(result)