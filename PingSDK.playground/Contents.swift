@testable import PingSDK_Sources

ping(api: "https://httpbin.org/post", lat: 43.670890, lon: -79.389640, callback: { data in
    if let res = String(data: data, encoding: .utf8) {
        print(res)
    }
})
