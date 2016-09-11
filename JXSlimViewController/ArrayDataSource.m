//
//  ArrayDataSource.m
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/10.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()
/** 数据模型 */
@property (nonatomic, strong) NSArray *items;
/** 重用标识符 */
@property (nonatomic, copy) NSString *cellIdentifier;
/** block */
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation ArrayDataSource

- (instancetype)init {
    return nil;
}

- (id)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)identifier
           configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = identifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}



- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.items[indexPath.row];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                             forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    
    
    self.configureCellBlock(cell , item);
    
    return cell;
    
}

@end
