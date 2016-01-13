//
//  LGHomeDataTool.m
//  有范吗?
//
//  Created by 唐磊guang on 16/1/12.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//


#import "LGHomeDataTool.h"
@interface LGHomeDataTool()

@property (strong , nonatomic)FMDatabase *database;

@end


@implementation LGHomeDataTool


-(instancetype)init
{
    if (self = [super init])
    {
        _database = [FMDatabase databaseWithPath:self.path];
        if ([_database open])
        {
            NSLog(@"数据库打开了");
        }
        [self createTable];
    }
    return self;
}

+(LGHomeDataTool *)shareInstance
{   //用于创建一个单例的数据库
    static LGHomeDataTool *tool = nil;
    if (tool == nil) {
        tool = [[self alloc]init];
        
    }
    return tool;
}

-(void)createTable
{
    NSString *tableStr = @"create table if not exists FavioriteTable(id integer primary key autoincrement,brand varchar(128),code varchar(128),saleprice varchar(128),mainImage varchar(128),name varchar(128),number varchar(32))";
    BOOL isCreat = [self.database executeUpdate:tableStr];
    if (isCreat) {
        NSLog(@"表创建成功");
        
        /*
         @property (nonatomic, copy) NSString *ID;
         
         @property (nonatomic, copy) NSString *desc;
         
         @property (nonatomic, assign) NSInteger status;
         
         @property (nonatomic, assign) NSInteger stockCount;
         
         @property (nonatomic, copy) NSString *marketTime;
         
         @property (nonatomic, assign) NSInteger favoriteCount;
         
         @property (nonatomic, copy) NSString *brand;
         
         @property (nonatomic, copy) NSString *brandUrl;
         
         @property (nonatomic, copy) NSString *code;
         
         @property (nonatomic, copy) NSString *sale_price;
         
         @property (nonatomic, copy) NSString *price;
         
         @property (nonatomic, copy) NSString *branD_ID;
         
         @property (nonatomic, copy) NSString *mainImage;
         
         @property (nonatomic, copy) NSString *statusname;
         
         @property (nonatomic, copy) NSString *name;
         */
    }
}
-(void)insertAnModel:(LGHomePayModel *)model
{
    if ([self findAppID:model]) {
        return;
    }
//    @"create table if not exists FavioriteTable(id integer primary key autoincrement, varchar(128), varchar(128), varchar(128), varchar(128),,varchar(128))";
    NSString *insertStr = @"insert into FavioriteTable(brand,code,saleprice,mainImage,name,number)values(?,?,?,?,?,?)";
    BOOL isInsert = [self.database executeUpdate:insertStr,model.clsInfo.brand,model.clsInfo.code, model.clsInfo.sale_price,model.clsInfo.mainImage,model.clsInfo.name,@"1"];
    if (isInsert) {
        NSLog(@"差成功");
    }
}

-(NSArray *)selectAllModel
{
    NSString *seleteStr = @"select * from FavioriteTable";
    FMResultSet *resurlt = [self.database executeQuery:seleteStr];
    NSMutableArray *array = [NSMutableArray array];
    while ([resurlt next]) {
        Clsinfo *model = [[Clsinfo alloc]init];
        model.code = [resurlt objectForColumnName:@"code"];
        model.sale_price = [resurlt objectForColumnName:@"saleprice"];
        model.brand = [resurlt objectForColumnName:@"brand"];
        model.mainImage = [resurlt objectForColumnName:@"mainImage"];
        model.name = [resurlt objectForColumnName:@"name"];
        model.number = [[resurlt objectForColumnName:@"number"]integerValue];
        if (![model.mainImage isKindOfClass:[NSNull class]]) {
            [array addObject:model];
        }
        
        
    }
    return array;
}

-(void)removeAModel:(LGHomePayModel *)model
{
    NSString *deleteStr = [NSString stringWithFormat:@"delete from FavioriteTable where applicationId = '%@'",model.clsInfo.code];
    [self.database executeUpdate:deleteStr];
}

-(NSInteger)countOfFavorite
{
    NSArray *array = [self selectAllModel];
    return array.count;
}
#pragma 私有方法，主要负责查重
-(BOOL)findAppID:(LGHomePayModel *)model
{
    BOOL flag = NO;
    NSString *seleteStr = [NSString stringWithFormat:@"select * from FavioriteTable where code = '%@'",model.clsInfo.code];
    FMResultSet *result = [self.database executeQuery:seleteStr];
    while ([result next]) {
        
        NSString * number = [result objectForColumnName:@"number"];
        
        int num = [number intValue];
        num++;
        NSString *change = [NSString stringWithFormat:@"UPDATE FavioriteTable SET number = %d WHERE code = %@",num,model.clsInfo.code];
        [self.database executeUpdate:change];
        
        
        flag = YES;
        break;
    }
    return flag;
}






#pragma mark- setter 和getter
-(NSString *)path
{
    NSString *pathStr = [NSString stringWithFormat:@"%@/Documents/haveDetyle",NSHomeDirectory()];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:pathStr])
    {
        [manager createDirectoryAtPath:pathStr withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [NSString stringWithFormat:@"%@/home.db",pathStr];
}

-(void)removeAll
{
    NSString *dropSql = [NSString stringWithFormat:@"drop table %@",self.path];
    [_database executeUpdate:dropSql];
    [self createTable];
}
@end
