//
//  HMZProductController.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/5.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZProductController.h"
#import "HMZProduct.h"
#import "HMZProductCell.h"

@interface HMZProductController ()

@property (strong, nonatomic) NSArray *products;

@end
@implementation HMZProductController

static NSString *cellID = @"cellID";
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 16;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(16, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    return [self init];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"HMZProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:cellID];
    
    // 设置collecticon的背景色
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.91 green:0.93 blue:0.93 alpha:1];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HMZProduct *product = self.products[indexPath.row];
    UIApplication *app = [UIApplication sharedApplication];
// "title": "有道云笔记",
// "stitle":"随时随地，记录一切",
// "id": "com.youdao.note.iphone",
// "url": "http://itunes.apple.com/app/id450748070?mt=8",
// "icon": "youdaonote",
// "customUrl": "youdaonote"

    //应用程序的url  youdaonote://com.youdao.note.iphone
    NSURL *appUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",product.customUrl,product.ids]];
    
    //appStore 的url http://itunes.apple.com/app/id450748070?mt=8
    NSURL *storeUrl = [NSURL URLWithString:product.url];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >=9.0) {
        if (![app openURL:appUrl]) {
            
            [app openURL:storeUrl];
        }
    }else if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
        if ([app canOpenURL:appUrl]) {
            [app openURL:appUrl];
        }else{
            [app openURL:storeUrl];
        }
    }
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.products.count;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HMZProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.product = self.products[indexPath.row];
    return cell;
}

//懒加载
- (NSArray *)products{
    if (!_products) _products = [HMZProduct products];
    return _products;
}

@end
