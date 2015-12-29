//
//  HMZGudieCell.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZGudieCell.h"

@interface HMZGudieCell ()
@property (nonatomic, weak) UIImageView *imageView;
@end
@implementation HMZGudieCell

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = kScreenSize;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}


- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}
@end
