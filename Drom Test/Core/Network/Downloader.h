//
//  Downloader.h
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#ifndef Downloader_h
#define Downloader_h

NS_ASSUME_NONNULL_BEGIN

@interface Downloader: NSObject
- (void)download:(NSString *)imageUrl completionHandler:(void (^)(NSData *data))completionHandler;
@end

NS_ASSUME_NONNULL_END

#endif /* Downloader_h */
