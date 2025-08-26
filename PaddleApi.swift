import Foundation

public class PaddleApi {

    public init() throws {
       
    }

    public func downloadModel(url: URL, fileName: String, completion: @escaping (Result<URL, Error>) -> Void) {

        let (tempUrl, _) = try await URLSession.shared.download(from: url)
        let data = try Data(contentsOf: tempUrl)
        // 计算 SHA256
        let hash = SHA256.hash(data: data)
        let hashString = hash.compactMap { String(format: "%02x", $0) }.joined()
        guard hashString.lowercased() == expectedHash.lowercased() else {
            throw NSError(domain: "ModelDownloader", code: -1, userInfo: [NSLocalizedDescriptionKey: "哈希校验失败"])
        }
  

        let task = URLSession.shared.downloadTask(with: url) { tempLocalURL, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let tempLocalURL = tempLocalURL else {
                completion(.failure(NSError(domain: "PaddleApi", code: -1, userInfo: [NSLocalizedDescriptionKey: "临时文件路径为空"])))
                return
            }

            do {
                // 获取文档目录
                let documentsURL = try FileManager.default.url(
                    for: .documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: true
                )
                let savedURL = documentsURL.appendingPathComponent(fileName)

                // 如果文件已存在，先删除
                if FileManager.default.fileExists(atPath: savedURL.path) {
                    try FileManager.default.removeItem(at: savedURL)
                }

                // 移动下载的临时文件到目标位置
                try FileManager.default.moveItem(at: tempLocalURL, to: savedURL)
                completion(.success(savedURL))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
