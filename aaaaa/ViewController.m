//
//  ViewController.m
//  aaaaa
//
//  Created by Tim Wang on 15/5/27.
//  Copyright (c) 2015年 Tim Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *aa,*a2;
    UITableView *ta;
    UIView *vv;
    UILabel *ll;
    NSInteger choice_number;
    NSInteger cell_height;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    aa=@[@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"aaaaaaa2222aaaaaaaaaaaaaaaaaaa",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555"];
    
    a2=@[@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"aaaaaaa2222aaaaaaaaaaaaaaaaaaa",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"111",@"222",@"333",@"444",@"555",@"aaa",@"aaa",@"3aaa33",@"4bbb44",@"55bbb5",@"1bbb1",@"2bbb22",@"333",@"444",@"555",@"111",@"222",@"333",@"111",@"222",@"333",@"888",@"555",@"111",@"222",@"333",@"444",];

    ta=[[UITableView alloc]init];
    ta.delegate=self;
    ta.dataSource=self;
    
    //设置所取cell编号
    choice_number=22;
    //cell高度
    cell_height=40;

    
    ta.frame=CGRectMake(0, 30,self.view.frame.size.width, self.view.frame.size.height-50);
    
    [self.view addSubview:ta];
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //scrollview滚动时判断所选cell位置，并进行调整
    
    if(scrollView.contentOffset.y>=cell_height*choice_number)
    {
        [vv setFrame:CGRectMake(0,scrollView.contentOffset.y, self.view.frame.size.width, cell_height-1)];
    
        [vv setBackgroundColor:[UIColor whiteColor]];
    }else
    {
        [vv setFrame:CGRectMake(0,cell_height*choice_number, self.view.frame.size.width, cell_height-1)];
        
        [vv setBackgroundColor:[UIColor clearColor]];
    }
    
    
 if(scrollView.contentOffset.y>([aa count]-15)*40+40*2)
 {
     NSLog(@"aa");
 
     //aa=a2;
     
     
   //  [ta reloadData];
     
     ta.frame=CGRectMake(ta.frame.origin.x, ta.frame.origin.y-40*2, ta.frame.size.width, ta.frame.size.height);
     ta.scrollEnabled=NO;
     
 
     
     
 }

}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  cell_height;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [aa count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==choice_number )
    {
        vv.backgroundColor=[UIColor clearColor];
    }else
    {
        vv.backgroundColor=[UIColor whiteColor];
    }

    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell  = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableIdentifier"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableIdentifier"];
        
    }
    cell.textLabel.text=[aa objectAtIndex:indexPath.row];
    
    
    //将所选cell设置一个view取代
      if(indexPath.row==choice_number && !vv)
    {
   
        vv=[[UIView alloc]init];
        [vv setFrame:CGRectMake(0,cell_height*choice_number, self.view.frame.size.width, cell_height-1)];
        ll=[[UILabel alloc]init];
        vv.backgroundColor=[UIColor whiteColor];
        ll.text=[aa objectAtIndex:choice_number];
        [ll setFrame:CGRectMake(15,0, self.view.frame.size.width, cell_height-1)];
        [vv addSubview:ll];
        [ta.viewForBaselineLayout addSubview:vv];
        
        //设成NO则无法选择当前cell
        vv.userInteractionEnabled=NO;
 
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
