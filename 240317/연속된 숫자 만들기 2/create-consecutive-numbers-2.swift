var arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

arr.sort()

if arr[0] + 1 == arr[1] && arr[1] + 1 == arr[2] {
    print(0)
} else if arr[0] + 2 == arr[1] || arr[1] + 2 == arr[2] {
    print(1)
} else {
    print(2)
}