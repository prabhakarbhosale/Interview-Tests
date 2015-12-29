//
//  ViewController.h
//  PhotoGallery
//
//  Created by Sachin Patil on 24/08/15.
//  Copyright (c) 2015 Cuelogic Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebserviceAPI.h"

@protocol PhotoPreviewDelegate;

@interface ViewController : UIViewController
{
    id <PhotoPreviewDelegate> delegate;
}
@property (nonatomic, assign) id <PhotoPreviewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;

//-(void)preview:(NSString*)stringUrl;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollectionView;

@end

