import Foundation

func ping(api: String, lat: Double = 0.0, lon: Double = 0.0) {
    let url = URL(string: api)!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // set JSON payload
    let payload = try? JSONSerialization.data(withJSONObject: [
        "lat": lat,
        "lon": lon,
    ])
    request.httpBody = payload
    // init URL session
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        if let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString)")
        }
    }
    task.resume()
}

ping(api: "https://httpbin.org/post")
