let nht = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nht[0], h = nht[1], t = nht[2]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.max
for i in 0...n-t {
    var sum = 0
    for height in arr[i..<i+t] {
        let diff = abs(h - height)
        sum += diff
    }

    result = min(result, sum)
}

print(result)