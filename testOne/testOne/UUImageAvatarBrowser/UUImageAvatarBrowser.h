//  UUImageAvatarBrowser.h
//  LinZhiLin
//
//  Created by 孙亚锋 on 2017/6/2.
//  Copyright © 2017年 LN. All rights reserved.
//


#import <UIKit/UIKit.h>
@class UUImageAvatarBrowser;
@interface UUImageAvatarBrowser : NSObject

+(UUImageAvatarBrowser *)sharedAvatarBrowser;


//show imageView on the keyWindow
- (void)showImage:(UIImageView*)avatarImageView;



/*
// 将图片保存到 相册
void UIImageWriteToSavedPhotosAlbum (
                                     UIImage *image,
                                     id  completionTarget,
                                     SEL completionSelector,
                                     void *contextInfo
                                     
                                     );
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
*/


@end

