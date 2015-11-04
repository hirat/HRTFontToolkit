//
//  HRTFontListTableViewController.m
//  HRTFontToolkit
//
//  Created by Hirat on 15/1/19.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HRTFontListTableViewController.h"
#import "HRTFontTableViewCell.h"
#import <UIViewController+HRTAppModule.h>
#import <JLRoutes.h>

@interface HRTFontListTableViewController ()
@property (nonatomic, strong) NSMutableArray* dataSource;
@end

@implementation HRTFontListTableViewController

- (void)awakeFromNib
{
    NSArray* familyNames = [UIFont familyNames];
    NSArray* sortedFamilyNames = [familyNames sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    self.dataSource = [NSMutableArray arrayWithArray: sortedFamilyNames];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* familyName = self.dataSource[section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName: familyName];
    return fontNames.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HRTFontTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"HRTFontTableViewCell" forIndexPath: indexPath];
    
    NSString* familyName = self.dataSource[indexPath.section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName: familyName];
    cell.fontName = fontNames[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    NSString* familyName = self.dataSource[indexPath.section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName: familyName];
    NSString* fontName = fontNames[indexPath.row];
    
    NSURL* url = [NSURL URLWithString: [NSString stringWithFormat: @"font/detail?fontName=%@", fontName]];
    [JLRoutes routeURL: url withParameters: nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat height = [self tableView: tableView heightForHeaderInSection: section];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), height)];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel* label = [[UILabel alloc] initWithFrame: CGRectInset(view.bounds, 15, 0)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor lightGrayColor];
    label.text = self.dataSource[section];
    
    [view addSubview: label];
    
    return view;
}

@end
