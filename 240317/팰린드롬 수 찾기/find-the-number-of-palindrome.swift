let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let x = xy[0], y = xy[1]

var result = 0
for i in x...y {
    let nums = Array(String(i))
    if nums == nums.reversed() {
        result += 1
    }
}
print(result)