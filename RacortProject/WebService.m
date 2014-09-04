//
//  WebService.m
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import "WebService.h"

@implementation WebService

+(BOOL)login : (NSString*)type : (NSString*) name : (NSString*) pass
{
    
    NSString *url =  @"http://172.246.16.27/ornito/login.php";
    
    NSString *post = [NSString stringWithFormat:@"type=%@&user=%@&pass=%@",type , name , pass];
    
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString: url]];
    
    [ request setHTTPMethod: @"POST"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [ request setHTTPBody: postData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    
    NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
    
    /*
     NSError* error;
     NSDictionary* json = [NSJSONSerialization
     JSONObjectWithData:returnData //1
     
     options:kNilOptions
     error:&error];
     
     NSString *ret ;
     
     for (NSString *s in json) {
     ret = s;
     }
     */
    NSLog(@"%@" , content);
    
    return 0;
}

+(NSDictionary *)searchGroup : (NSString *)name
{
    NSString *url =  @"http://172.246.16.27/ornito/group.php";
    
    NSString *post = [NSString stringWithFormat:@"name=%@",name];
    
   // NSLog(@"%@" , post);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString: url]];
    
    [ request setHTTPMethod: @"POST"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [ request setHTTPBody: postData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    
    //NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
    
    
     NSError* error;
     NSDictionary* json = [NSJSONSerialization
     JSONObjectWithData:returnData //1
     
     options:kNilOptions
     error:&error];
     
     //NSString *ret ;
     
    return json;
}


@end
