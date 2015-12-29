//
//  CategoryViewCell.h
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoObject.h"
#import "ViewController.h"

@interface CategoryViewCell : UICollectionViewCell

@property (assign, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) ViewController *vc;

@property (weak, nonatomic) NSArray *photoObjects;

-(void)setDetailedObjectsWithItems:(NSArray*)items;

-(void)setDetailedObjectsWithPhotoObjects:(NSArray*)items;

@end
