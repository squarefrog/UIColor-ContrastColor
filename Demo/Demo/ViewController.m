//
//  ViewController.m
//  Demo
//
//  Created by Paul Williamson on 30/06/2014.
//
//

#import "ViewController.h"
#import "ColorCell.h"
#import "HeaderView.h"

#import "UIColor+ContrastingColor.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()
@property (strong, nonatomic) NSArray *colors;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colors = @[
                    @"0xCCCCCC", @"0x999999", @"0x666666", @"0x333333",
                    @"0xff0000", @"0x00FF00", @"0x0000FF", @"0xFFFF00",
                    @"0xFF00FF", @"0x00FFFF", @"0xFFCC00", @"0xCCFF00",
                    @"0x00CCFF", @"0xFF6600", @"0xFF0066", @"0x006666",
                    @"0x0099CC", @"0x666600", @"0xCC00CC", @"0xCC6666"
                    ];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ColorCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ColorCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ColorCell";
    
    ColorCell *cell = (ColorCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *value = self.colors[indexPath.row];
    
    unsigned int hex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:value];
    [scanner scanHexInt:&hex];
    
    UIColor *backgroundColor = UIColorFromRGB(hex);
    cell.backgroundColor = backgroundColor;
    
    switch (indexPath.section) {
            
        case SQFContrastingColorFiftyPercentMethod:
            cell.contrastView.backgroundColor = [backgroundColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod];
            break;
            
        case SQFContrastingColorYIQMethod:
            cell.contrastView.backgroundColor = [backgroundColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind != UICollectionElementKindSectionHeader) {
        return nil;
    }
    
    HeaderView *header = (HeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    
    switch (indexPath.section) {
            
        case SQFContrastingColorFiftyPercentMethod:
            header.titleLabel.text = @"50% Method";
            break;
            
        case SQFContrastingColorYIQMethod:
            header.titleLabel.text = @"YIQ Method";
            break;
            
        default:
            break;
    }
    
    return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.bounds), 100);
}

@end
