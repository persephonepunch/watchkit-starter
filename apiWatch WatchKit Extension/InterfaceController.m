//
//  InterfaceController.m
//  apiWatch WatchKit Extension
//
//  Created by YOONSUN LEE on 2/25/15.
//  Copyright (c) 2015 YOONSUN LEE. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)updateWeather {
    NSURLRequest* urlRequest =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Chicago"]];
    
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest: urlRequest returningResponse:&response error:&error];
    
    //NSString* myData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    //NSLog(myData);
    
    NSMutableDictionary *allData =[NSJSONSerialization
     JSONObjectWithData:data options:
     NSJSONReadingMutableContainers error:&error];

    NSString *currentWeather = nil;
    
    NSArray* weather = allData[@"weather"];
    for  (NSDictionary *theWeather in weather){
        currentWeather = theWeather[@"main"];
    }

    self.myLabel.text = currentWeather;
}



@end



