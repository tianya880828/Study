//
//  CollectionViewController.m
//  TestProject
//
//  Created by yichengxu on 15/5/8.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "CollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "Masonry.h"
#import "ShowViewController.h"

static NSString * const kCollectionViewCellIdentifier = @"TestCell";

@interface CollectionViewController () <UICollectionViewDataSource,
                                        UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"集合视图";
    
    [self.view addSubview:self.collectionView];
 //   self.collectionView.frame = self.view.frame;

    UIEdgeInsets padding = UIEdgeInsetsFromString(@"10,10,10,10");
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);

    }];
    
  //  self.navigationItem.backBarButtonItem.title = @"ccc";
    
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;

//
//    UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
//    temporaryBarButtonItem.title=@"Back";
//    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [backButton setImage:[UIImage imageNamed:@"back"]forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarButton;
   

}

- (void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
  //  self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView
{
    if (nil == _collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

        flowLayout.sectionInset                = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.itemSize                    = CGSizeMake(100, 120);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
      
        
        _collectionView.collectionViewLayout = flowLayout;
        
        [_collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
        
        
    }
    
    return _collectionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

# pragma mark - UICollectionViewDataSource & UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShowViewController *viewController = [[ShowViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:@"image1"];
    cell.textLbl.text = [NSString stringWithFormat:@"Index_%ld", indexPath.row];
    
    return cell;
    
}

@end
