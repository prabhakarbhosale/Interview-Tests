//
//  CategoryObject.h
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryObject : NSObject

@property (weak, nonatomic)  NSString *categoryName;
@property (strong, nonatomic)  NSArray *photoObjects;

@end
