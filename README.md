
<p align="center">
<img src="https://img.shields.io/badge/platform-react--native%20%5Bios%5D-blue.svg" alt="React Native iOS" />
<a href="https://www.npmjs.com/package/react-native-file-preview"><img src="https://img.shields.io/npm/v/react-native-file-preview.svg?style=flat-square" alt="npm version" /></a>
<img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" />
</p>


react-native-file-preview is a simple library to preview files. It's written in native code, support iOS platform (using WKWebView).

* **Features:**
  * iOS 9.0+, iPhone and iPad devices
  * Most popular document types (xlsx, pptx, docx, images, pdf, html, etc...)
  * Zoom in/out using gestures
  * Support network resources (https://) and local resources (file://)
  * Support large files, better performance compared to QuickLook implementation
  * Support AirPrint

<table>
  <tr>
    <th>
      <img src="https://github.com/wangrq/react-native-file-preview/raw/master/example/Media/iPhone.gif"/>
    </th>
    <th>
      <img src="https://github.com/wangrq/react-native-file-preview/raw/master/example/Media/iPad.gif"/>
    </th>
  </tr>
</table>



## Usage

```javascript
import FilePreview from 'react-native-file-preview';

FilePreview.showPreview("https://acdbio.com/sites/default/files/sample.ppt");
```



## Installation

The package can be added via npm or yarn:

`$ yarn add react-native-file-preview`

### Link the packge

`$ react-native link react-native-file-preview`

### Post link steps

After the link you'll need two extra steps to make it working. It's simple to configure them using XCode:

**Step 1. Copy the image resouces**
1. Click the **project name** in XCode Project navigator, choose your **project name** in the TARGETS sestion (to the right or the Project navigator).
2. Click **Build Phases**, click **Copy Bundle Resources**.
3. Drag the **RNFilePreviewBundle.bundle** file (under Project Navagator - Libraries - RNFilePreview.xcodeproj) to **Copy Bundle Resources**.



<img src="https://github.com/wangrq/react-native-file-preview/raw/master/example/Media/install_step_1.jpg"/>



**Step 2. Add the Swift bridging header (skip this step if you already use Swift in your iOS project)**

1. Right click the souce code folder (the yellow folder contains AppDelegate.m） in the Project navigator (the left panel in XCode).
2. Select **New File**, choose **iOS - Source - Swift file**, choose **Create**.
3. XCode will popup a dialog asking "Would you like to configure an Objective-C bridging header?". Choose **Create Bridging Header**.



<img src="https://github.com/wangrq/react-native-file-preview/raw/master/example/Media/install_step_2.jpg"/>



## APIs

**FilePreviewHelper.showPreview(path)**

**FilePreviewHelper.showPreview(path, showPrintButton)**

**FilePreviewHelper.showPreview(path, showPrintButton, showBlackStatusBar)**

* path: string
  + The document file path. (https://www.exmaple.com/example.pdf, or file://FULL_LOCAL_PATH)

* showPrintButton: boolean
  + should the preview page show the AirPrint button
  + default value is true

* showBlackStatusBar: boolean
  + should the preview page show the status bar in balck
  + default value is true
