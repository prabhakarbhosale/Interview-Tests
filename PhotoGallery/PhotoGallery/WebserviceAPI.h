//
//  WebserviceAPI.h
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#define BaseURLString @"http://192.168.10.104"

typedef void (^ CompletionBlock)(id, bool);

@interface WebserviceAPI : NSObject

-(void)callWebService:(CompletionBlock)completionBlock;;

@end
