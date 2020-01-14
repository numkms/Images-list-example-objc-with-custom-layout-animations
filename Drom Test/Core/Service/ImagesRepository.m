//
//  ImagesRepository.m
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesRepository.h"
#import "Cache.h"
#import "Downloader.h"
@implementation ImagesRepository: NSObject

-(id)init {
    
  if (self = [super init]) {
      _cache = [[Cache alloc] initWithStorageKey: @"imageRepo"];
      _downloader = [[Downloader alloc] init];
  }
    
  return self;
}

- (void)getImageBy:(NSString *)imageUrl completionHandler:(void (^)(NSData *data))completionHandler {
    if ([_cache isCached: imageUrl]) {
        completionHandler([_cache getDataBy: imageUrl]);
    } else {
        [_downloader download:imageUrl completionHandler:^(NSData *data) {
            completionHandler(data);
            [_cache save: data with: imageUrl];
        }];
        
    }
}


- (void) clearimagesCache {
    [_cache flush];
}



@end
