//
//  WebPreviewController.swift
//
//  Created by Renquan Wang on 2017-08-26.
//  Copyright © 2017 Renquan Wang. All rights reserved.
//

import UIKit
import WebKit

class WebPreviewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView? = nil
    var activityView: UIActivityIndicatorView? = nil
    var imageButtons: [UIImageView] = []
    var dataURL: URL? = nil
    var bundle: Bundle? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.bundle = Bundle(for: WebPreviewController.self)
        if let bundleUrl = self.bundle?.url(forResource: "RNFilePreviewBundle", withExtension: "bundle") {
            self.bundle = Bundle(url: bundleUrl)
        }
        self.automaticallyAdjustsScrollViewInsets = false
        self.webView = WKWebView()
        self.webView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView!)
        let views: [String: Any] = ["webView": webView!, "topLayoutGuide": topLayoutGuide, "bottomLayoutGuide": bottomLayoutGuide]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[webView]-0-|", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[webView]-0-|", options: [], metrics: nil, views: views))
        webView?.navigationDelegate = self

        if (self.showButton()) {
            let exitButton = self.makeImageButton("baseline_fullscreen_exit_white_48pt");
            self.view.addSubview(exitButton);
            self.imageButtons.append(exitButton);

            var imageViews: [String: Any] = ["exitButton": exitButton, "topLayoutGuide": topLayoutGuide, "bottomLayoutGuide": bottomLayoutGuide]

            var vflHorizontal = "H:[exitButton(52)]-32-|"
            if (FilePreviewHelper.showPrintButton) {
                let printButton = self.makeImageButton("baseline_print_white_48pt");
                self.view.addSubview(printButton);
                self.imageButtons.append(printButton);

                imageViews["printButton"] = printButton
                vflHorizontal = "H:[printButton(52)]-32-[exitButton(52)]-32-|"
                self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[printButton(52)]-32-[bottomLayoutGuide]", options: [], metrics: nil, views: imageViews))

                let printGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(printImageTapped(tapGestureRecognizer:)))
                printButton.addGestureRecognizer(printGestureRecognizer)
            }
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflHorizontal, options: [], metrics: nil, views: imageViews))
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[exitButton(52)]-32-[bottomLayoutGuide]", options: [], metrics: nil, views: imageViews))
            let exitGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(exitImageTapped(tapGestureRecognizer:)))
            exitButton.addGestureRecognizer(exitGestureRecognizer)
        }
        if (true) {
            let activityView = UIActivityIndicatorView(style: .gray)
            self.view.addSubview(activityView)
            let bounds = UIScreen.main.bounds
            activityView.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
            activityView.startAnimating()
            activityView.hidesWhenStopped = true
            self.activityView = activityView
        }
    }

    func makeImageButton(_ name: String) -> UIImageView {
        let imageButton = UIImageView()
        imageButton.image = UIImage(named: name, in: self.bundle, compatibleWith: nil)
        imageButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageButton.isUserInteractionEnabled = true
        imageButton.contentMode = .center
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.isUserInteractionEnabled = true
        return imageButton
    }

    @objc func exitImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
        if (FilePreviewHelper.showBlackStatusBar) {
            UIApplication.shared.statusBarStyle = FilePreviewHelper.statusBarStyle
        }
    }

    @objc func printImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfo.OutputType.general
        printInfo.jobName = webView?.url?.pathComponents.last ?? ""
        printInfo.duplex = UIPrintInfo.Duplex.none
        printInfo.orientation = UIPrintInfo.Orientation.portrait

        printController.printFormatter = webView!.viewPrintFormatter()
        printController.printPageRenderer = nil
        printController.printingItems = nil

        printController.printInfo = printInfo
        printController.showsPageRange = true
        printController.showsNumberOfCopies = true
        printController.present(animated: true, completionHandler: nil)
    }

    func showButton() -> Bool {
        return true
    }

    func getPreviewHtml() -> String {
        return ""
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Loading \(self.dataURL?.path ?? "")")
        webView?.load(URLRequest(url: self.dataURL!))
    }


    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.onWebViewDone()
        }
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.onWebViewDone()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    func getInstance() -> WebPreviewController {
        return WebPreviewController()
    }

    func onWebViewDone() {
        self.activityView?.stopAnimating()
    }
}
