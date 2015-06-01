//
//  ViewController.m
//  PhotoChallenge
//
//  Created by Alex Santorineos on 5/31/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "SubClass.h"
#import "Picture.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray* array;
@property NSMutableArray* array2;
@property NSIndexPath *indexPath;

@property CollectionViewCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.delegate = self;

    Picture *paul = [[Picture alloc]initWithImage:[UIImage imageNamed:@"paul"]];
     Picture *orlando = [[Picture alloc]initWithImage:[UIImage imageNamed:@"orlando"]];
     Picture *actors = [[Picture alloc]initWithImage:[UIImage imageNamed:@"actors"]];

    
    _array = [[NSMutableArray alloc]initWithObjects:paul,actors,orlando, nil];
    [self apiMethod];


}


-(void)apiMethod{
    NSString *stringUrl = @"https://api.instagram.com/v1/tags/chicago/media/recent?count=100&client_id=75569aa57d504ccaae5d5436174d258d";
    NSURL *url = [[NSURL alloc]initWithString:stringUrl];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {


        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];


        self.array2 = [jsonDictionary objectForKey:@"data"];

        NSDictionary *dictionaryImage = [_array2 objectAtIndex:_indexPath.row];

      //
//
//
//
//        }

//        NSLog(@"++++++%@++++++",_array2);


        [self.collectionView reloadData];
        
    }];
    
}






-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array2.count;

}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    _indexPath = indexPath;
    self.cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellOne" forIndexPath:indexPath];

//    Picture *picture = [self.array objectAtIndex:indexPath.row];

    //    //2nd layer - dictioanry

    NSDictionary *dictionary = [self.array2 objectAtIndex:indexPath.row];
    //3rd layer - dictioanry

       NSDictionary *images = [dictionary objectForKey:@"images"];

    NSDictionary *standardRes = [images objectForKey:@"standard_resolution"];

    NSLog(@"%@",standardRes);

    NSString *urlString = [standardRes objectForKey:@"url"];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *imagee = [UIImage imageWithData:imageData];
    _cell.backgroundView= [[UIImageView alloc]initWithImage:imagee];

//
//    NSURL *imageURL = [NSURL URLWithString:[standardRes objectForKey:@"url"]];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Update the UI
//            _cell.imageView.image = [UIImage imageWithData:imageData];
//        });
//    });


    self.cell.backgroundColor = [UIColor redColor];

    return self.cell;
}


@end
