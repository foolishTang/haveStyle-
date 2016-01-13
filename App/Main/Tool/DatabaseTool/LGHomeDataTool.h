//
//  LGHomeDataTool.h
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "LGHomePayModel.h"
@interface LGHomeDataTool : NSObject

@property (nonatomic , copy)NSString *path;

+ (LGHomeDataTool *)shareInstance;

-(NSInteger)countOfFavorite;

- (NSArray *)selectAllModel;

- (void)insertAnModel:(LGHomePayModel *)model;

-(void)removeAll;

-(void)removeAModel:(LGHomePayModel *)model;


@end
