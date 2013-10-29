#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
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
    
    NSLog(@" %@", json);
    
    NSDictionary * feed = [json objectForKey:@"feed"];
    
    for (NSString * s in feed) {
        NSLog(@"feed: %@", s);
    }
}



















@end
