
//  UUImageAvatarBrowser.m
//  LinZhiLin
//
//  Created by 孙亚锋 on 2017/6/2.
//  Copyright © 2017年 LN. All rights reserved.
//


#import "UUImageAvatarBrowser.h"

static UIImageView *orginImageView;

static UIImageView *showImageView;

static id _AvatarBrowser;

@implementation UUImageAvatarBrowser

+(id)alloc{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _AvatarBrowser = [super alloc];
    });
    return _AvatarBrowser;
}
+(UUImageAvatarBrowser *)sharedAvatarBrowser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_AvatarBrowser == nil) {
            _AvatarBrowser = [[UUImageAvatarBrowser alloc]init];
        }
    });
    return _AvatarBrowser;

}

- (void)showImage:(UIImageView *)avatarImageView{
    UIImage *image= avatarImageView.image;
    orginImageView = avatarImageView;
    orginImageView.alpha = 0;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    CGRect oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.7];
    backgroundView.alpha=1;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [backgroundView addSubview:imageView];
   
    
    [window addSubview:backgroundView];
    
    showImageView = imageView;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];

    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
    
    /*
    UIButton * saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(window.width - 80,window.height - 60, 60, 30);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveImageToPhoneAlbum:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:saveBtn];
    ``````````````````````````````````````````````````````````````````````                                                                                                                                                      */
    
}
/*
-(void)saveImageToPhoneAlbum:(UIButton *)button{
   
    if (showImageView) {
        UIImageWriteToSavedPhotosAlbum(showImageView.image, self, @selector(image: didFinishSavingWithError:contextInfo:), nil);
 
    }
}
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    NSString *msg = nil;
    if (error != nil) {
        msg = @"保存图片失败";
    }else{
        msg = @"保存图片成功,打开照片程序即可查看";
    }
    [JRToast showWithText:msg duration:2.0f];
    
   
}
*/


- (void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=[orginImageView convertRect:orginImageView.bounds toView:[UIApplication sharedApplication].keyWindow];
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
        orginImageView.alpha = 1;
        backgroundView.alpha=0;
    }];
}

@end
