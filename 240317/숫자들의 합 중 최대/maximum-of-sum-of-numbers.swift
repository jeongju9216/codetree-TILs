let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let x = xy[0], y = xy[1]

var result = 0
for i in x...y {
    let nums = Array(String(i)).map { Int(String($0))! }
    let sum = nums.reduce(0, +)
    result = max(result, sum)
}

print(result)