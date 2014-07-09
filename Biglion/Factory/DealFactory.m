//
//  DealFactory.m
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import "DealFactory.h"

@implementation DealFactory

+ (EKObjectMapping*) dealFactory;
{
    return [EKObjectMapping mappingForClass:[Deal class] withBlock:^(EKObjectMapping *mapping) {
        [mapping mapFieldsFromArray:@[@"image",
                                      @"name",
                                      @"short_name",
                                      @"original_price",
                                      @"discount"]];
    }];
}

@end
