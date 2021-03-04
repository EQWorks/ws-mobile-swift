@testable import PingSDK_Sources

log(
    api: "https://httpbin.org/post",
    lat: 43.670890,
    lon: -79.389640,
    callback: { data in
        print(data)
    }
)
