//
//  ViewController.m
//  PhotoGallery
//
//  Created by Sachin Patil on 24/08/15.
//  Copyright (c) 2015 Cuelogic Technologies. All rights reserved.
//

#import "ViewController.h"
#import "CategoryViewCell.h"
#import "ParseDataObject.h"

static NSArray *categoryObjects;
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    WebserviceAPI *apiObject;
    NSArray *categoryNameArray, *categoryData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    apiObject = [WebserviceAPI new];
    self.categoryCollectionView.dataSource = self;
    self.categoryCollectionView.delegate = self;

    
    [apiObject callWebService:^(id result, bool status) {
        
        if(status)
        {
            NSLog(@"result \n%@",result);
            NSDictionary *dictionary = [[NSDictionary alloc] initWithDictionary:result];
            
            categoryNameArray = [dictionary allKeys];
            categoryData = [dictionary allValues];
            
            categoryObjects = [[NSArray alloc]initWithArray:[ParseDataObject createCategoryObjectsFromData:result]];
            
            [self.categoryCollectionView reloadData];

        }
        else
            NSLog(@"failure");
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return categoryObjects.count;
    
    return categoryNameArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryViewCell *cell = (CategoryViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    cell.categoryName.text = [categoryName objectAtIndex:indexPath.row];
//    [cell setDetailedObjectsWithItems:[categoryData objectAtIndex:indexPath.row]];

    CategoryObject *catObje = [categoryObjects objectAtIndex:indexPath.row];
    
    cell.categoryName.text = catObje.categoryName;
    
    cell.vc = self;
    
    [cell setDetailedObjectsWithPhotoObjects:catObje.photoObjects];

    return cell;
}

-(void)preview:(NSString*)stringUrl
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BaseURLString,stringUrl]];
    [self.previewImageView setImageWithURL:url placeholderImage:nil];
}
@end


