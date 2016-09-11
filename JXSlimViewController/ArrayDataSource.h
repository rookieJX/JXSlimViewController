//
//  ArrayDataSource.h
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/10.
//  Copyright © 2016年 王加祥. All rights reserved.
//

// 这里需要导入 UIKit 
#import <UIKit/UIKit.h>

/**
 *  定义一个block，用来传递参数
 *
 *  @param cell 表格
 *  @param item 表格属性
 */
typedef void (^TableViewCellConfigureBlock)(id cell, id item);


@interface ArrayDataSource : NSObject <UITableViewDataSource>

/**
 *  初始化数据源方法
 *
 *  @param items               传入数据源数组
 *  @param identifier          重用标识符
 *  @param aConfigureCellBlock 传入block
 *
 *  @return 返回数据源
 */
- (id)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)identifier
           configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;


/**
 *  用来获取对应表格的属性
 *
 *  @param indexPath 表格
 *
 *  @return 属性
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;


@end
