//
//  WebserviceAPI.m
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "WebserviceAPI.h"


@implementation WebserviceAPI

-(void)callWebService:(CompletionBlock)completionBlock
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/imageData.php",BaseURLString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"Response Object\n%@",responseObject);
        
        completionBlock(responseObject,true);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Response Object Error\n%@",[error localizedDescription]);

        
        completionBlock(error,false);
    }];
    
    // 5
    [operation start];

}
@end
