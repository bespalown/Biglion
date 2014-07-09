//
//  Manager.m
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import "Manager.h"
#import "AFNetworking.h"
#import "DealFactory.h"

@implementation Manager

- (void)getDataFromUrlString:(NSString *)urlString
                       block:(void (^) (NSArray* array)) block
                   failBlock:(void (^) (NSException *exception)) blockException
{
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData  timeoutInterval:15];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
         {
             NSDictionary* dataResult = [JSON objectForKey:@"result"];
             NSArray* dataDealsArray = [dataResult objectForKey:@"deals"];
             
             NSArray *dealsArray = [EKMapper arrayOfObjectsFromExternalRepresentation:dataDealsArray withMapping:[DealFactory dealFactory]];
             block(dealsArray);
         }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
         {
             NSException *exception = [[NSException alloc] initWithName:@"Что то пошло не так"
                                                                 reason:@"Ошибка получения данных с апи"
                                                               userInfo:nil];
             blockException(exception);
         }];
    [operation start];
}

@end
