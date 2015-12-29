//
//  HMZProduct.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/5.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZProduct.h"

@implementation HMZProduct

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ids = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)products{
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil]];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self productWithDict:dict]];
    }
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {title: %@, stitle: %@ }", self.class, self, self.title, self.stitle];
}
@end
