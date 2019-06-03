
import { NativeModules } from 'react-native';

const { FilePreviewHelper } = NativeModules;

function showPreview(path, showPrintButton = true, showBlackStatusBar = true) {
  FilePreviewHelper.showPreview(path, showPrintButton, showBlackStatusBar);
}

export default {
  showPreview: showPreview,
};
