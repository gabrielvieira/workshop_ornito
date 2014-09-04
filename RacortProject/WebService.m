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

+(BOOL)insertGroup : (Group *)grupo
{
    NSString *url =  @"http://172.246.16.27/ornito/insertGroup.php";
    
    NSString *post = [NSString stringWithFormat:@"name=%@&horary=%@&description=%@&location=%@&contact=%@&id_user=%d", grupo.name , grupo.horario , grupo.description , grupo.local , grupo.contact , grupo.id_user];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString: url]];
    
    [ request setHTTPMethod: @"POST"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [ request setHTTPBody: postData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    
    NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
    
    int x = [content integerValue];
    
    if (x) {
        return 1;
    }
    else
    {
        return 0;
    }
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
}

@end
