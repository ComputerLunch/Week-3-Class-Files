#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSArray *keys = [NSArray arrayWithObjects:@"key1", @"key2" , nil];
    NSArray *objects = [NSArray arrayWithObjects:@"value1", @"value2", nil];
    
    // New mutable dictionary with pare of keys and objects
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionaryWithObjects:objects 
                                                           forKeys:keys];
    // Print out dictionary
    for (id key in dictionary) {
        NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
    }
    
    NSLog(@"-------------\n");
    
    // Add new objects to the dictionary
    [dictionary setObject:@"Andrew" forKey:@"name"];
    [dictionary setObject:@"410-379-6598" forKey:@"phone"];
    
    // reset a current key
    [dictionary setObject:@"new value" forKey:@"key1"];
    
    
    for (id key in dictionary) {
        NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
    }
}

@end
