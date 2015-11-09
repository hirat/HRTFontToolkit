//
//  HRTFontDetailTableViewController.m
//  HRTFontToolkit
//
//  Created by Hirat on 15/1/19.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HRTFontDetailTableViewController.h"
#import "HRTFontDetailTableViewCell.h"
#import <JLRoutes.h>
#import <UIViewController+HRTAppModule.h>

@interface HRTFontDetailTableViewController ()
@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) NSMutableArray* dataSource;

@end

@implementation HRTFontDetailTableViewController

- (void)setParameters:(NSDictionary *)parameters
{
    self.fontName = parameters[@"fontName"];
}

- (void)setFontName:(NSString *)fontName
{
    _fontName = fontName;
    
    self.title = fontName;
    
    self.font = [UIFont fontWithName: fontName size: [UIFont systemFontSize]];
    NSDictionary* fontAttributes = @{@"familyName": self.font.familyName,
                                     @"fontName": self.font.fontName,
                                     @"pointSize": @(self.font.pointSize),
                                     @"ascender": @(self.font.ascender),
                                     @"descender": @(self.font.descender),
                                     @"capHeight": @(self.font.capHeight),
                                     @"xHeight": @(self.font.xHeight),
                                     @"lineHeight": @(self.font.lineHeight),
                                     @"leading": @(self.font.leading)};
    
    self.dataSource = [NSMutableArray array];
    
    [fontAttributes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSDictionary* info = @{@"Title": key,
                               @"SubTitle": [NSString stringWithFormat: @"%@", obj]};
        [self.dataSource addObject: info];
    }];
}

- (void)loadView
{
    [super loadView];
    
    self.tableView.backgroundColor = [UIColor colorWithRed: 243/255.0 green: 248/255.0 blue: 248/255.0 alpha: 0.9];
    [self setupTitleView];
}

- (void)setupTitleView
{
    UILabel *headlinelabel = [UILabel new];
    headlinelabel.font = self.font;
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.text = self.fontName;
    
    [headlinelabel sizeToFit];
    
    [self.navigationItem setTitleView:headlinelabel];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRTFontDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"HRTFontDetailTableViewCell" forIndexPath:indexPath];
    
    NSDictionary* info = self.dataSource[indexPath.row];
    cell.textLabel.text = info[@"Title"];
    cell.detailTextLabel.text = info[@"SubTitle"];
    
    return cell;
}

@end
