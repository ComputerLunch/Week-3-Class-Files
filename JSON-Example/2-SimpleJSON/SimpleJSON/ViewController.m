#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// Example based on this link - JSON and Xcode (iOS): The Basics
//http://sketchytech.blogspot.com/2012/04/json-and-xcode-ios-basics.html


///////////////////////////////////////
// 1. example_1.json - flat array
///////////////////////////////////////
- (void)viewDidLoad
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example_1" ofType:@"json"];
    // Retrieve local JSON file called example.json
    
    NSError *error = nil; // This so that we can access the error if something goes wrong 
    
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    // Load the file into an NSData object called JSONData 
   
    NSArray* json = [NSJSONSerialization 
                          JSONObjectWithData:jsonData 
                          
                          options:kNilOptions 
                          error:&error];
    
    NSLog(@" %@" , [json objectAtIndex:3] );
    
    // Print Array
    NSLog(@"JSON: %@", json ); 
    
    // Print each item in array
    for (NSString *s in json) {

        NSLog(@"items: %@", s );
    }
}

/*
///////////////////////////////////////
// 2. example_2.json
///////////////////////////////////////
- (void)viewDidLoad
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example_2" ofType:@"json"];
    NSError *error = nil;     
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
   
    NSDictionary* json = [NSJSONSerialization 
                     JSONObjectWithData:jsonData 
                     
                     options:kNilOptions 
                     error:&error];
    
    // DUMP ALL JSON
    NSLog(@"JSON: %@", json ); 
    
    // Print each item in NSDictionary
    
    for (NSString *s in json) {
        NSLog(@"items: %@", s );
    }

    // Print each individual item
    for (NSDictionary *d in json) {
        NSLog(@"color: %@ , value: %@", [d objectForKey:@"color"] , [d objectForKey:@"value"]);
    }
}
*/

///////////////////////////////////////
// 3. example_3.json
///////////////////////////////////////
/*- (void)viewDidLoad
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example_3" ofType:@"json"];
    NSError *error = nil;     
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:jsonData 
                          
                          options:kNilOptions 
                          error:&error];
    
    // Dump all JSON 
    //NSLog(@"JSON: %@", json ); 
    
    // Print each node KEY
    for (NSString *s in json) {
        NSLog(@"items: %@", s );
    }
    
    
    NSLog(@"id: %@",[json objectForKey:@"id"] );
    NSLog(@"name: %@",[json objectForKey:@"name"] );
    NSLog(@"type: %@",[json objectForKey:@"type"] );
    

    NSDictionary * topping = [json objectForKey:@"topping"];
    
    for (NSString *s in topping) {
        NSLog(@"topping: %@", s );
    }

    NSDictionary * batter = [json objectForKey:@"topping"];
    
    for (NSDictionary *d in batter) {
        NSLog(@"id: %@ , type: %@", [d objectForKey:@"id"] , [d objectForKey:@"type"]);
    }
}*/

/*
///////////////////////////////////////
// 4. example_4.json
///////////////////////////////////////
- (void)viewDidLoad{
NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example_4" ofType:@"json"];
NSError *error = nil;     
NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];

NSDictionary* json = [NSJSONSerialization 
                      JSONObjectWithData:jsonData 
                      
                      options:kNilOptions 
                      error:&error];

    // Dump all JSON
    //NSLog(@"JSON: %@", json ); 

    // Print each node KEY
    for (NSString *s in json) {
        NSLog(@"items: %@", s );
    }

    NSDictionary * addressValue = [json objectForKey:@"address"];
        
    for(NSString * s in addressValue){
        NSLog(@" ADDRESS: %@", s);
    };
                        
        
    NSArray * phoneValue = [json objectForKey:@"phoneNumber"];

    for (NSDictionary *s in phoneValue) {
        NSLog(@"PHONE: %@ %@" , [s objectForKey:@"number"],[s objectForKey:@"type"] );
    }
}
 */









@end
