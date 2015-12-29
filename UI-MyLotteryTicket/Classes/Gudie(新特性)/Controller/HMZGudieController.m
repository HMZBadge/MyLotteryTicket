//
//  HMZGudieController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZGudieController.h"
#import "HMZGudieCell.h"
#import "UIView+HMZFrame.h"
#import "HMZNavigationController.h"
#import "HMZTabBarController.h"

@interface HMZGudieController ()
@property (weak, nonatomic) UIImageView* largeImageView;
@property (weak, nonatomic) UIImageView* largeTextView;
@property (weak, nonatomic) UIImageView* smallTextView;

@property (assign, nonatomic) NSInteger page;
@end

@implementation HMZGudieController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
//    CALayer.anchorPoint
    //UICollectionViewLayout
    //UICollectionViewTransitionLayout
    //UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = kScreenSize.size;
    //方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[HMZGudieCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //添加图片
    // 获取大图片名字
    NSString* largeImageName = @"guide1";
    // 获取大图ps
    UIImage* largeImage = [UIImage imageNamed:largeImageName];
    
    // 获取大文字的名字
    NSString* largeTextName = @"guideLargeText1";
    // 获取大文字图片
    UIImage* largeText = [UIImage imageNamed:largeTextName];
    
    // 获取小文字的名字
    NSString* smallTextName = @"guideSmallText1";
    // 获取大文字图片
    UIImage* smallText = [UIImage imageNamed:smallTextName];
    
    // imageView
    UIImageView* largeImageView = [[UIImageView alloc] initWithImage:largeImage];
    UIImageView* largeTextView = [[UIImageView alloc] initWithImage:largeText];
    largeTextView.y = kScreenHeight * 0.75;
    UIImageView* smallTextView = [[UIImageView alloc] initWithImage:smallText];
    smallTextView.y = kScreenHeight * 0.85;
    
    // 给全局属性赋值
    self.largeImageView = largeImageView;
    self.largeTextView = largeTextView;
    self.smallTextView = smallTextView;
    
    // 添加三个imageView
    [self.collectionView addSubview:largeImageView];
    [self.collectionView addSubview:largeTextView];
    [self.collectionView addSubview:smallTextView];
 
    
    // 添加波浪线
    UIImageView* lineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    lineView.x = -202;
    [self.collectionView addSubview:lineView];
    
    // 创建一个进入按钮
    UIButton* enterBtn = [[UIButton alloc] init];
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [enterBtn sizeToFit];
    enterBtn.x = 3 * kScreenWidth + (kScreenWidth - enterBtn.w) * 0.5;
    enterBtn.y = kScreenHeight * 0.9;
    // 监听点击事件
    [enterBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.collectionView addSubview:enterBtn];

}

- (void)enter{
    HMZTabBarController *tab = [[HMZTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
}

// scrollView 已经减速完成
- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    // 获取偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 计算页数
    int page = offsetX / kScreenWidth;
    
    if (page > self.page) {
        // 从右往左滑(手)
        self.largeImageView.x = offsetX + kScreenWidth;
        self.largeTextView.x = offsetX + kScreenWidth;
        self.smallTextView.x = offsetX + kScreenWidth;
    }
    else {
        // 从左往右滑(手)
        self.largeImageView.x = offsetX - kScreenWidth;
        self.largeTextView.x = offsetX - kScreenWidth;
        self.smallTextView.x = offsetX - kScreenWidth;
    }
    
    //NSLog(@"%d", page);
    
    // 获取大图片名字
    NSString* largeImageName = [NSString stringWithFormat:@"guide%d", page + 1];
    // 获取大图
    UIImage* largeImage = [UIImage imageNamed:largeImageName];
    // 获取大文字的名字
    NSString* largeTextName = [NSString stringWithFormat:@"guideLargeText%d", page + 1];
    // 获取大文字图片
    UIImage* largeText = [UIImage imageNamed:largeTextName];
    // 获取小文字的名字
    NSString* smallTextName = [NSString stringWithFormat:@"guideSmallText%d", page + 1];
    // 获取大文字图片
    UIImage* smallText = [UIImage imageNamed:smallTextName];
    
    // 更换图片
    self.largeImageView.image = largeImage;
    self.largeTextView.image = largeText;
    self.smallTextView.image = smallText;
    // 加特技
    [UIView animateWithDuration:0.25
                     animations:^{
                         // 让介绍图片的x改变
                         self.largeImageView.x = offsetX;
                         self.largeTextView.x = offsetX;
                         self.smallTextView.x = offsetX;
                     }];
    
    // 保存当前的页数
    self.page = page;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMZGudieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    NSString* imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    cell.image = image;
    
    return cell;
}



@end
