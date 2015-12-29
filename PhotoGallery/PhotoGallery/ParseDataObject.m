//
//  ParseDataObject.m
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "ParseDataObject.h"

@implementation ParseDataObject

+(NSArray*)createCategoryObjectsFromData:(id)data
{
    NSMutableArray *categoryObjectArray = [NSMutableArray new];
    NSArray *allKeys = [data allKeys];
    
    for(NSString *key in allKeys)
    {
        CategoryObject *catObj = [[CategoryObject alloc]init];
        NSArray *photoData = [data objectForKey:key];
        catObj.photoObjects = [ParseDataObject createPhotoObjectsFromData:photoData];
        catObj.categoryName = key;
        [categoryObjectArray addObject:catObj];
    }
    return categoryObjectArray;
}

+(NSArray*)createPhotoObjectsFromData:(NSArray*)data
{
    NSMutableArray *photoObjectArray = [NSMutableArray new];
    for(NSDictionary *dict in data)
    {
        PhotoObject *object = [[PhotoObject alloc]init];
        object.photoName = [dict objectForKey:@"name"];
        object.photoUrl = [dict objectForKey:@"imgURL"];
        [photoObjectArray addObject:object];
    }
    return photoObjectArray;
}
@end
