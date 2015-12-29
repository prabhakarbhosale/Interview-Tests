//
//  PhotoObject.h
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoObject : NSObject

@property (weak, nonatomic)  NSString *categoryName;
@property (weak, nonatomic)  NSString *photoName;
@property (weak, nonatomic)  NSString *photoUrl;

@end
