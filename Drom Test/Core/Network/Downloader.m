//
//  Downloader.m
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Downloader.h"

@implementation Downloader : NSObject

- (void)download:(NSString *)imageUrl completionHandler:(void (^)(NSData *data))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, false), ^(void) {
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
            NSURLSession *session = [NSURLSession sharedSession];
            
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (!error) {
                    //Запустим блок в главном потоке
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionHandler(data);
                    });
                }
                else {
                    NSLog(@"Ошибка запроса: %@", [error localizedDescription]);
                }
            }];
            [task resume];
    });
    

}

@end
