//
//  ViewController.m
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Event.h"
#import "EventDetailViewController.h"
#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchBar;
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;






@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    NSArray *abc = @[@1, @2, @3];
    NSDictionary *bca = @{@"key": @"value", @"key2": @"value2"};

    NSArray *animals = @[@"elephant", @"badger", @"mouse", @"toad"];
    NSArray *reverseAnimals = animals.reverseObjectEnumerator.allObjects;
    NSArray *sortedAnimals = [animals sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@", [sortedAnimals componentsJoinedByString:@", "]);

    NSNumber *number =@12345678;
    NSLog(@"%@", [number descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"fr"]]);



    NSLog(@"%@", bca);
    NSLog(@"%@", abc);





//    [Event performSearchWithKeyword:@"mobile" completion:^(NSArray *varName) {
//        self.dataArray = varName;
//        [self.tableView reloadData];
//    }];

}


#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
//    Event *e = self.dataArray[indexPath.row];
    NSDictionary *eventActual = [self.dataArray objectAtIndex:indexPath.row];

//    NSLog(@"%@", e);

    cell.textLabel.text = [eventActual objectForKey:@"name"];
    cell.detailTextLabel.text = [eventActual objectForKey:@"status"];

//    cell.textLabel.text = e.name;
//    cell.detailTextLabel.text = e.address;
//    if (e.photoURL)
//    {
//        NSURLRequest *imageReq = [NSURLRequest requestWithURL:e.photoURL];
//        
//        [NSURLConnection sendAsynchronousRequest:imageReq queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//           dispatch_async(dispatch_get_main_queue(), ^{
//               if (!connectionError) {
//                   [cell.imageView setImage:[UIImage imageWithData:data]];
//                   [cell layoutSubviews];
//               }
//           });
//
//
//        }];
//        
//        
//    }else
//    {
//       [cell.imageView setImage:[UIImage imageNamed:@"logo"]];
//    }

    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventDetailViewController *detailVC = [segue destinationViewController];

    Event *e = self.dataArray[self.tableView.indexPathForSelectedRow.row];
//    NSLog(@"%@", e);
        detailVC.event = e;
}

#pragma searchbar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end
