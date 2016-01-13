//
//  LGPayTitleCell.m
//  有范吗?
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 唐磊guang. All rights reserved.
//

#import "LGPayTitleCell.h"
#import "UIImageView+WebCache.h"
#define ImageH 300
#define margon 10

@interface LGPayTitleCell()<UIScrollViewDelegate>

@property (weak , nonatomic)UIScrollView *scrollView;
@property (weak , nonatomic)UILabel *pageLabel;

@property (weak , nonatomic)UILabel *nameLabel;
@property (weak , nonatomic)UILabel *saleLabel;
@property (weak , nonatomic)UILabel *laterLabel;
@property (weak , nonatomic)UILabel *numLabel;
@property (weak , nonatomic)UILabel *niceLabel;
@property (weak , nonatomic)UILabel *favoLabel;

@end

@implementation LGPayTitleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //可滑动的照片
        UIScrollView *scroll = [[UIScrollView alloc]init];
        self.scrollView = scroll;
        scroll.frame = CGRectMake(0, 0, ScreenW, ImageH);
        [self.contentView addSubview:scroll];
        scroll.delegate = self;
        scroll.pagingEnabled = YES;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW-40, ImageH-15,40, 12)];
        label.textAlignment =  NSTextAlignmentCenter;
        label.backgroundColor = [UIColor grayColor];
        label.textColor = [UIColor whiteColor];
        self.pageLabel = label;
        [self.contentView addSubview:label];
        self.nameLabel = [self createLabel];
        self.saleLabel = [self createLabel];
        self.laterLabel = [self createLabel];
        self.numLabel = [self createLabel];
        self.niceLabel = [self createLabel];
        self.favoLabel = [self createLabel];
    }
    return self;
}
-(UILabel *)createLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:label];
    return label;
}


-(void)setModel:(LGHomePayModel *)model
{
    if (self.model != nil) {
        return;
    }
    
    if (model==nil) {
        return;
    }
    _model = model;
    NSArray *imageArr = model.proPicUrl;
    
    //图片翻转标记
    self.pageLabel.text = [NSString stringWithFormat:@"1/%d",(int)imageArr.count];
    
    int i = 0;
    for (; i<imageArr.count; i++) {
        
        Propicurl *proPic = imageArr[i];
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.scrollView addSubview:imageView];
        [imageView sd_setImageWithURL:[NSURL URLWithString:proPic.filE_PATH]];
        CGFloat x = i*ScreenW;
        CGFloat y = 0;
        CGFloat w = ScreenW;
        CGFloat h = ImageH;
        imageView.tag = 666+i;
        imageView.frame = CGRectMake(x, y, w, h);
    }
    self.scrollView.contentSize = CGSizeMake(ScreenW*i, ImageH);
    
    Clsinfo *clsinfoM = model.clsInfo;
    
    //物品名字
    CGFloat nameX = 6;
    CGFloat nameY = ImageH+5;
    CGFloat nameW = ScreenW;
    CGFloat nameH = 19;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    self.nameLabel.text = clsinfoM.name;
    //热卖价格
    CGFloat saleX = nameX;
    CGFloat saleY = CGRectGetMaxY(self.nameLabel.frame)+margon;
    CGFloat saleW = 70;
    CGFloat saleH = 22;
    self.saleLabel.frame = CGRectMake(saleX, saleY, saleW, saleH);
    self.saleLabel.font = [UIFont boldSystemFontOfSize:21];
    self.saleLabel.text = clsinfoM.sale_price;
    
    //以前的价格
    if (![clsinfoM.sale_price isEqual:clsinfoM.price]) {
        CGFloat laterX = CGRectGetMaxX(self.saleLabel.frame)+1;
        CGFloat laterY = saleY;
        CGFloat laterW = ScreenW-saleW;
        CGFloat laterH = 19;
        self.laterLabel.frame = CGRectMake(laterX, laterY, laterW, laterH);
        self.laterLabel.text = clsinfoM.price;
    }
    //收藏  好评 。。
    Commoncounttotal *totalM = model.commonCountTotal;
    
    CGFloat numX = saleX;
    CGFloat numY = CGRectGetMaxY(self.saleLabel.frame)+margon;
    CGFloat numW = ScreenW/3.0f;
    CGFloat numH = 19;
    self.numLabel.frame = CGRectMake(numX,numY, numW, numH);
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.text = [NSString stringWithFormat:@"月销量%d件",(int)totalM.saleQty];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(ScreenW/3.0f, numY+3, 0.5, 13)];
    lineView1.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineView1];
    
    
    CGFloat niceX = ScreenW/3.0f;
    CGFloat niceY = numY;
    CGFloat niceW = ScreenW/3.0f;
    CGFloat niceH = 19;
    self.niceLabel.frame = CGRectMake(niceX, niceY, niceW, niceH);
    self.niceLabel.text = [NSString stringWithFormat:@"好评度%@",totalM.percent];
    self.niceLabel.textAlignment = NSTextAlignmentCenter;
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(ScreenW*2/3.0f, numY+3, 0.5, 13)];
    lineView2.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineView2];
    
    CGFloat favoX = ScreenW*2/3.0f;
    CGFloat favoY = niceY;
    CGFloat favoW = ScreenW/3.0f;
    CGFloat favoH = 19;
    self.favoLabel.frame = CGRectMake(favoX, favoY, favoW, favoH);
    self.favoLabel.text = [NSString stringWithFormat:@"收藏%d人",(int)totalM.favoritCount];
    self.favoLabel.textAlignment = NSTextAlignmentCenter;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSArray *imageArr =self.model.proPicUrl;
    self.pageLabel.text = [NSString stringWithFormat:@"%d/%d",(int)(scrollView.contentOffset.x/ScreenW+1),(int)imageArr.count];
}
-(void)dealloc
{
    NSLog(@"dealloc");
}
@end
