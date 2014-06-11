//
//  SingleMovieViewController.m
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/10/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import "SingleMovieViewController.h"

@interface SingleMovieViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lvlDesc;

@end

@implementation SingleMovieViewController
@synthesize rtMovie;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //NSLog(@"Open %@", self.rtMovie.title);
    
    self.title = self.rtMovie.title;
    
    self.lblTitle.text = self.rtMovie.title;
    self.lvlDesc.text = self.rtMovie.desc;
    [self.lvlDesc sizeToFit];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.rtMovie.imgHigh]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //NSLog(@"%@", object);
        
        if(data != nil)
            self.imgView.image = [UIImage imageWithData:data];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
