//
//  Single.m
//  RacortProject
//
//  Created by Gabriel Vieira on 03/09/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import "Single.h"

@implementation Single


+(id)criarClasse{
    static Single *singleton = nil;
    if (!singleton) {
        singleton = [[super allocWithZone:nil] init];
    }
    
    return singleton;
    
}

+(id) allocWithZone:(struct _NSZone *)zone{
    return [self criarClasse];
}


- (id)init {
    self = [super init];
    
    if (!self.lista) {
        self.lista = [[NSArray alloc]init];
    }
    if(!self.userName){
        self.userName = [[NSString alloc]init];
    }

    return self;
}
-(NSString*)getUserName{
    return self.userName;
}



@end
