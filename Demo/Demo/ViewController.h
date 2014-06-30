//
//  ViewController.h
//  Demo
//
//  Created by Paul Williamson on 30/06/2014.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
