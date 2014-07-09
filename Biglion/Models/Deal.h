//
//  Deal.h
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deal : NSObject

@property (nonatomic, strong) NSString* image;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* short_name;
@property (nonatomic, assign) NSInteger original_price;
@property (nonatomic, assign) NSInteger discount;

@end
