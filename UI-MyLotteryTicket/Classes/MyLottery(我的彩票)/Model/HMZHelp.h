//
//  HMZHelp.h
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMZHelp : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *html;
@property (nonatomic,copy) NSString *ids;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)helpWithDict:(NSDictionary *)dict;

+ (NSArray *)helps;



@end
