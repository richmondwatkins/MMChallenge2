//
//  City.h
//  MMChallenge2
//
//  Created by Richmond on 10/10/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CityDelegate
-(NSString *)returnCityUrl;
@end

@interface City : NSObject
@property NSString *name;
@property NSString *state;
@property UIImage *image;
@end
