//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/9/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import "MoviesViewController.h"
#import "SingleMovieViewController.h"
#import "MovieCell.h"
#import "RTMovie.h"
#import "AFNetworking.h"

@interface MoviesViewController ()
{
    UIRefreshControl *refreshControl;
}

@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (nonatomic, strong) NSArray *arrMovies;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *viewActivity;

@property (nonatomic, retain) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UILabel *lblNetwork;

@end

@implementation MoviesViewController
@synthesize refreshControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Movies";
        [self.viewActivity startAnimating];
        [self.viewActivity sizeToFit];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=nzcf8nhgweu25apbw2pj297x";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if(data != nil)
        {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //NSLog(@"%@", object);
        
            self.arrMovies = object[@"movies"];
            [self.tblView reloadData];
        }
        
        self.lblNetwork.hidden = (connectionError == nil);
        
        [self.viewActivity stopAnimating];
    }];
    
    self.tblView.dataSource = self;
    self.tblView.rowHeight = 85;
    
    [self.tblView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    
    self.tblView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    [self.tblView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];}

- (void)refreshTable {
    //TODO: refresh your data
    
    [self.viewActivity startAnimating];
    
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=nzcf8nhgweu25apbw2pj297x";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if(data != nil)
        {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //NSLog(@"%@", object);
            
            self.arrMovies = object[@"movies"];
            [self.tblView reloadData];
        }
        
        self.lblNetwork.hidden = (connectionError == nil);
        
        [self.viewActivity stopAnimating];
        [refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMovies.count;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RTMovie *rtMovie = [[RTMovie alloc] initWithDictionary:self.arrMovies[indexPath.row]];
    
    SingleMovieViewController *smv = [[SingleMovieViewController alloc] init];
    smv.rtMovie = rtMovie;
    
    [self.navigationController pushViewController:smv animated:YES];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *mCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    RTMovie *rtMovie = [[RTMovie alloc] initWithDictionary:self.arrMovies[indexPath.row]];
    
    mCell.lblTitle.text = rtMovie.title;
    mCell.lblDesc.text = rtMovie.desc;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:rtMovie.imgLow]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //NSLog(@"%@", object);
        
        if(data != nil)
            mCell.imgView.image = [UIImage imageWithData:data];    
    }];
    
    return mCell;
}

@end
