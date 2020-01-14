//
//  ImagesRepository.h
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#ifndef ImagesRepository_h
#define ImagesRepository_h
#import "Downloader.h"
#import "Cache.h"
@interface ImagesRepository : NSObject

- (void)getImageBy:(NSString *)imageUrl completionHandler:(void (^)(NSData *data))completionHandler;
@property NSArray *urls;
@property Downloader *downloader;
@property Cache *cache;

@end

#endif /* ImagesRepository_h */
