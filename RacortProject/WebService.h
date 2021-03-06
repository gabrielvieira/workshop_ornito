//
//  WebService.h
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"

@interface WebService : NSObject

+(BOOL)login : (NSString*)type : (NSString*) name : (NSString*) pass;
+(NSDictionary*)searchGroup : (NSString *)name;

+(BOOL)insertGroup : (Group *)grupo;
@end
