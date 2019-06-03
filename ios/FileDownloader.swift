//
//  FileDownloader.swift
//  RNFilePreview
//
//  Created by Renquan Wang on 2019-06-03.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation


class FileDownloader {
    class func load(remoteUrl: URL, localUrl: URL, completion: @escaping (String) -> ()) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: remoteUrl)
        print("download from: \(remoteUrl.path) -> \(localUrl.path)")
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Succeed: \(statusCode)")
                }
                do {
                    try FileManager.default.copyItem(at: URL(fileURLWithPath: tempLocalUrl.path), to: URL(fileURLWithPath: localUrl.path))
                    completion(localUrl.path)
                } catch (let writeError) {
                    print("Failed: \(localUrl) : \(writeError)")
                }
            } else {
                print("Failed: %@", error?.localizedDescription ?? "");
            }
        }
        task.resume()
    }
    static func downloadFile(url: String, completion: @escaping (String) -> ()) {
        if let remoteUrl = URL(string: url) {
            if let localUrlStr = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first, let localUrl = URL(string: localUrlStr) {
                let filename = remoteUrl.pathComponents.last ?? UUID().uuidString
                FileDownloader.load(remoteUrl: remoteUrl, localUrl: localUrl.appendingPathComponent(filename), completion: completion)
            }
        }
    }

}
