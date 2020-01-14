//
//  Cache.m
//  Drom Test
//
//  Created by Владимир Курдюков on 14/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cache.h"

@implementation Cache: NSObject

-(id)initWithStorageKey: (NSString*) storageKey {
  
  if (self = [super init]) {
      _storageKey = storageKey;
  }
    
  return self;
}

//Сохраняем данные
- (void)save: (NSData *) data with: (NSString *) key {
    [[self defaults] setObject: data forKey: key];
}

//Получаем данные
- (NSData*) getDataBy: (NSString *) key {
    return [[self defaults] dataForKey: key];
}

//Чистим данные
- (void) flush {
    [[self defaults] removePersistentDomainForName: _storageKey];
}

//Проверяем закеширован ли данынй ключ
- (bool) isCached: (NSString *) key {
    return [self getDataBy:key] != NULL;
}

//Получаем userDefaults с заданым суитом
- (NSUserDefaults*) defaults {
    return  [[NSUserDefaults alloc] initWithSuiteName: _storageKey];
}


@end
