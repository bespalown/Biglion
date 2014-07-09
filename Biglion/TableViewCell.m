//
//  TableViewCell.m
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    _titleLabel.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.5];
    _titleLabel.numberOfLines = 2;
    _titleLabel.textColor = [UIColor whiteColor];
    
    _discountLabel.backgroundColor = [UIColor orangeColor];
    _discountLabel.font = [UIFont systemFontOfSize:18];
    
    _resultPriceLabel.textColor = [UIColor orangeColor];
    _resultPriceLabel.font = [UIFont systemFontOfSize:14];
    
    UIView* slabel = [[UIView alloc] initWithFrame:CGRectMake(_originalPriceLabel.frame.origin.x,
                                                              _originalPriceLabel.frame.origin.y + 22,
                                                              _originalPriceLabel.frame.size.width,
                                                              1)];
    [self addSubview:slabel];
    [slabel setBackgroundColor:_originalPriceLabel.textColor];
}

@end
