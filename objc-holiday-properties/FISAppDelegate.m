//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate






- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *database =
    @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
                                                 @"tinsel"         ,
                                                 @"lights"         ,
                                                 @"presents"       ,
                                                 @"wreath"         ,
                                                 @"mistletoe"      ,
                                                 @"Christmas music"
                                                 ] mutableCopy],
                       @"New Year's Day"   : [@[ @"party hats"     ,
                                                 @"kazoos"         ,
                                                 @"champagne"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Spring" : [@{ @"Memorial Day"     : [@[ @"American flag"  ,
                                                 @"memoirs"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Summer" : [@{ @"Independence Day" : [@[ @"fireworks"      ,
                                                 @"barbeque"       ,
                                                 @"picnic blanket" ,
                                                 @"sunscreen"
                                                 ] mutableCopy],
                       @"Labor Day"        : [@[ @"white jeans"    ,
                                                 @"shopping bag"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Fall"   : [@{ @"Veteran's Day"    : [@[ @"barbeque"       ,
                                                 @"American flag"
                                                 ] mutableCopy],
                       @"Thanksgiving Day" : [@[ @"turkey"         ,
                                                 @"gravy"          ,
                                                 @"mashed potatoes",
                                                 @"acorn squash"   ,
                                                 @"cranberry sauce",
                                                 @"napkins"
                                                 ] mutableCopy]
                       } mutableCopy]
       };
    
    NSLog(@"%@", database[@"Spring"]);
    
    
    
    NSMutableArray *supplies = [[NSMutableArray alloc] initWithObjects:@"TEST VALUE OF SUPPLY", nil];
    NSDictionary *addHoliday = [[NSDictionary alloc] initWithObjectsAndKeys:supplies, @"TESTTT KEY", nil];
    
    //[database[@"Winter"][0] ];
    database[@"Winter"][@"Test 3"] = supplies;
    NSLog(@"%@", addHoliday);
    NSLog(@"%@", database[@"Winter"]);
    
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    for (NSUInteger i = 0; i < [self.database[season] count]; i++) {
        if (self.database[season][holiday] != nil) {
            return true;
        }
    }
    
    return false;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    for (NSUInteger i = 0; i < [self.database[season][holiday] count]; i++) {
        if ([self.database[season][holiday][i] isEqualToString:supply]) {
            return true;
        }
    }
    
    return false;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *supplies = [[NSMutableArray alloc] init];
    
    self.database[season][holiday] = supplies;
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    
    [self.database[season][holiday] addObject:supply];
    
    // no return
}

@end
