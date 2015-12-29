//
//  ParseDataObject.h
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PhotoObject.h"
#import "CategoryObject.h"


@interface ParseDataObject : NSObject

+(NSArray*)createPhotoObjectsFromData:(NSArray*)data;
+(NSArray*)createCategoryObjectsFromData:(id)data;

@end
