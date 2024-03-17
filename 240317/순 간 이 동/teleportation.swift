let abxy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let a = abxy[0], b = abxy[1], x = abxy[2], y = abxy[3]

let c1 = abs(b - a)
let c2 = abs(a - x) + abs(b - y)
let c3 = abs(a - y) + abs(b - x)

let result = min(c1, c2, c3)
print(result)