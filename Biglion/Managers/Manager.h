//
//  Manager.h
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

- (void)getDataFromUrlString:(NSString *)urlString
                       block:(void (^) (NSArray* array)) block
                   failBlock:(void (^) (NSException *exception)) blockException;

@end
