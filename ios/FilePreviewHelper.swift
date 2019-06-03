//
//  WebPreviewControllerHelper.swift
//
//  Created by Renquan Wang on 2018-10-23.
//  Copyright © 2018 Code Complete. All rights reserved.
//

import UIKit

@objc(FilePreviewHelper)
class FilePreviewHelper: NSObject {
    static var showBlackStatusBar: Bool = false
    static var showPrintButton: Bool = false
    static var statusBarStyle: UIStatusBarStyle = .default
    var url: URL? = nil

    @objc func showPreview(_ path: String, showPrintButton: Bool, showBlackStatusBar: Bool) {
        DispatchQueue.main.async {
            FilePreviewHelper.showPrintButton = showPrintButton
            FilePreviewHelper.showBlackStatusBar = showBlackStatusBar
            self.url = URL(string: path)
            self.previewWithWebview()
        }
    }
    private func previewWithWebview() {
        let viewController = WebPreviewController()
        viewController.dataURL = self.url
        FilePreviewHelper.statusBarStyle = UIApplication.shared.statusBarStyle
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            rootVC.present(viewController, animated: true, completion: {
                if (FilePreviewHelper.showBlackStatusBar) {
                    UIApplication.shared.statusBarStyle = .lightContent
                }
            })
        }
    }
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
}
