//
//  WebPreviewManagerBirdge.m
//
//  Created by Renquan Wang on 2018-10-23.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(FilePreviewHelper, NSObject)

RCT_EXTERN_METHOD(showPreview:(NSString *)path showPrintButton:(BOOL *)showPrintButton showBlackStatusBar:(BOOL *)showBlackStatusBar)
@end
