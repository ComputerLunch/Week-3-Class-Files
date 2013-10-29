#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
//#define kLatestKivaLoansURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] //2

#define kYouTubeMostPop [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/standardfeeds/most_popular?v=2&alt=json"]

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        
        NSData * data = [NSData dataWithContentsOfURL:kYouTubeMostPop];
        
        [self performSelectorOnMainThread:@selector(fetchedData:) 
                               withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData 
                          
                          options:kNilOptions 
                          error:&error];
    
    NSDictionary * feed = [json objectForKey:@"feed"];

    // Print each item in NSDictionary feed
    for (NSString *s in feed) {
        NSLog(@"feed: %@", s );
    }
    
    NSLog(@"\n" );  // Extra space
    
    NSArray * entry = [feed objectForKey:@"entry"];
  
    /* for (NSString *s in entry) {
     NSLog(@"entry: %@", s );
     }*/
    
    
    ////////////////////////////////////////
    // Get first youtube object 
    ////////////////////////////////////////
    NSDictionary * node = [entry objectAtIndex:0]; 
    
    for (NSString *s in node) {
        NSLog(@"node: %@", s );
    }
    
    NSDictionary * title = [node objectForKey:@"title"];
    
    NSLog(@"\n" );
    NSLog(@"title: %@", [title objectForKey:@"$t"] );
    
    NSDictionary * media = [node objectForKey:@"media$group"];
    NSArray * thumbArray = [media objectForKey:@"media$thumbnail"];
    
    NSDictionary * thumb = [thumbArray objectAtIndex:0];

    NSLog(@"\n" );
    NSLog(@"thumURL: %@", [thumb objectForKey:@"url"] );

    
    ////////////////////////////////////////
    // Loop app entry nodes 
    ////////////////////////////////////////
       
    for (NSDictionary *e in entry) {
       
        NSDictionary * title = [e objectForKey:@"title"];
        
        NSLog(@"\n" );
        NSLog(@"title: %@", [title objectForKey:@"$t"] );
        
        NSDictionary * media = [e objectForKey:@"media$group"];
        NSArray * thumbArray = [media objectForKey:@"media$thumbnail"];
        
        NSDictionary * thumb = [thumbArray objectAtIndex:0];
        NSLog(@"thumURL: %@", [thumb objectForKey:@"url"] );
    }
}

@end
