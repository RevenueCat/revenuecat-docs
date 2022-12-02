@main
public struct iOS {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(iOS().text)
    }
}
