import Foundation

func ping(api: String, lat: Double = 0.0, lon: Double = 0.0) {
    // prepare HTTP request
    var req = URLRequest(url: URL(string: api)!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Accept")
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // set JSON payload
    let payload = try? JSONSerialization.data(withJSONObject: [
        "lat": lat,
        "lon": lon,
    ])
    req.httpBody = payload
    // init URL session
    let task = URLSession.shared.dataTask(with: req) { (data, _, error) in
        guard let data = data else { return }
        if let res = String(data: data, encoding: .utf8) {
            print(res)
        }
    }
    task.resume()
}
