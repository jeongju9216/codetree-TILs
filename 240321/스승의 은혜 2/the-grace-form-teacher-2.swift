let nb = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nb[0], b = nb[1]
var arr: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

arr.sort()

var result = 0
for i in 0..<n {
    var total = b
    var count = 0
    for j in 0..<n {
        let cost = i == j ? arr[j] / 2 : arr[j]
        if total >= cost {
            total -= cost
            count += 1
        } else {
            break
        }
    }
    
    result = max(result, count)
}
print(result)