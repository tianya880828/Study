//
//  ImageCollectionViewCell.m
//  TestProject
//
//  Created by yichengxu on 15/5/8.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "Masonry.h"

@implementation ImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (nil != self)
    {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.textLbl];
        
        [self addMasConstraints];
    }
    
    return self;
}

- (void)addMasConstraints
{
    UIEdgeInsets padding = UIEdgeInsetsFromString(@"{10,10,5,10}");
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(padding.top);
        make.left.equalTo(self.contentView.mas_left).with.offset(padding.left);
        make.bottom.equalTo(self.textLbl.mas_top).with.offset(-padding.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-padding.right);
    }];
    
    UIEdgeInsets lblPadding = UIEdgeInsetsMake(5, 10, 10, 10);
    
    [self.textLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.imageView.mas_bottom).with.offset(lblPadding.top);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-lblPadding.bottom);
//        make.top.equalTo(self.imageView.mas_bottom).with.offset(lblPadding.top);
//        make.left.equalTo(self.contentView.mas_left).with.offset(lblPadding.left);
//        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-lblPadding.bottom);
//        make.right.equalTo(self.contentView.mas_right).with.offset(-lblPadding.right);
    }];
}

- (UIImageView *)imageView
{
    if (nil == _imageView)
    {
        _imageView = [[UIImageView alloc] init];
        

    }
    
    return _imageView;
}

- (UILabel *)textLbl
{
    if (nil == _textLbl)
    {
        _textLbl = [[UILabel alloc] init];
        _textLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _textLbl;
}



@end
