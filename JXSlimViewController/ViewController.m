//
//  ViewController.m
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/10.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ViewController.h"
#import "JXArrayModel.h"
#import "ArrayDataSource.h"

/** 屏幕宽度 */
#define kWidth [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define kHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕尺寸 */
#define kScreen [UIScreen mainScreen].bounds

@interface ViewController ()<UITableViewDelegate>
/** viewController */
@property (nonatomic,weak) UITableView * tableView;
/** 接收数据模型 */
@property (nonatomic,strong) NSMutableArray * items;
/** 数据代理模型 */
@property (nonatomic,strong) ArrayDataSource * cellArrayDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 下载数据
    [self loadData];
    
}

#pragma mark - 下载数据
- (void)loadData {
    // 模拟网络请求下载
    NSString * path = [[NSBundle mainBundle] pathForResource:@"Source.plist" ofType:nil];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    // 这里将下载的数据保存到本地数组中
    for (NSDictionary * dict in array) {
        JXArrayModel * model = [JXArrayModel modelWithDict:dict];
        [self.items addObject:model];
    }

    [self tableView];
    
    TableViewCellConfigureBlock configure = ^(UITableViewCell * cell , JXArrayModel * model) {
        cell.imageView.image = [UIImage imageNamed:model.imageName];
        cell.textLabel.text = model.imageTitle;
    };
    
    self.cellArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.items
                                                       cellIdentifier:@"cell"
                                                   configureCellBlock:configure];
    

    self.tableView.dataSource = self.cellArrayDataSource;
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];

}


#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        UITableView * tableView = [[UITableView alloc] initWithFrame:kScreen style:UITableViewStylePlain];
        tableView.delegate = self;
        [self.view addSubview:tableView];
        // 由于是weak属性的全局变量，一定要重新赋值 赋值 赋值。
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
