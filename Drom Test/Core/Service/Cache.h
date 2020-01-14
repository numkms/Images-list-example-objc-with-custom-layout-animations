//
//  Cache.h
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#ifndef Cache_h
#define Cache_h
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface Cache: NSObject

@property (nonatomic, strong) NSString *storageKey;
- (id)initWithStorageKey: (NSString*) storageKey;
- (void) save: (NSData *) data with: (NSString *) key;
- (NSData*) getDataBy: (NSString *) key;
- (void) flush;
- (bool) isCached: (NSString *) key;
@end

NS_ASSUME_NONNULL_END

#endif /* Cache_h */
