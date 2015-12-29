//
//  CategoryViewCell.m
//  PhotoGallery
//
//  Created by Ganesh P on 29/12/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "CategoryViewCell.h"
#import "WebserviceAPI.h"


@implementation CategoryViewCell

-(void)setDetailedObjectsWithItems:(NSArray*)items
{
    int margin = 10;
    int width = 50;
    int height = 50;
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    for(UIView *v in [self.scrollView subviews])
        [v removeFromSuperview];
    
    for(int i =0 ; i<items.count ; i++)
    {
        NSDictionary *singleObject = items[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i * width) + (i * margin) + margin , margin, width, height);
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BaseURLString,singleObject[@"imgURL"]]]]];
            dispatch_async(dispatch_get_main_queue(), ^(){
                [button setBackgroundImage:image forState:UIControlStateNormal];
            });
        });
        
        [self.scrollView addSubview:button];
    }
    
    int count = (int)items.count * 2;
    
    self.scrollView.contentSize = CGSizeMake((count * width) + (count * margin) , self.scrollView.frame.size.height);

}


-(void)setDetailedObjectsWithPhotoObjects:(NSArray*)items
{
    _photoObjects = items;
    
    int margin = 10;
    int width = 50;
    int height = 50;
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    for(UIView *v in [self.scrollView subviews])
        [v removeFromSuperview];
    
    for(int i =0 ; i<items.count ; i++)
    {
        PhotoObject *singleObject = items[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i * width) + (i * margin) + margin , margin, width, height);
        button.tag = i;
        
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BaseURLString,singleObject.photoUrl]]]];
            dispatch_async(dispatch_get_main_queue(), ^(){
                [button setBackgroundImage:image forState:UIControlStateNormal];
            });
        });
        
        [self.scrollView addSubview:button];
    }
    
    int count = (int)items.count * 2;
    
    self.scrollView.contentSize = CGSizeMake((count * width) + (count * margin) , self.scrollView.frame.size.height);
    
}

-(void)buttonTapped:(UIButton*)sender
{
    NSLog(@"sender tag : %d", (int)sender.tag);
    
    PhotoObject *photoObje = [_photoObjects objectAtIndex:sender.tag];
    
    [_vc preview:photoObje.photoUrl];
}

@end
