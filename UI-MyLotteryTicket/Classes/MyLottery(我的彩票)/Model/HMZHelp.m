//
//  HMZHelp.m
//  UI-MyLotteryTicket
//
//  Created by 赵志丹 on 15/11/6.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZHelp.h"

@implementation HMZHelp

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ids = dict[@"id"];
    }
    return self;
}

+ (instancetype)helpWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)helps{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil]];
    
    NSArray *array= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self helpWithDict:dict]];
    }
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {title: %@, html: %@ }", self.class, self, self.title, self.html];
}
@end
