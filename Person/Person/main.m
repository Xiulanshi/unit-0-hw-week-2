//
//  main.m
//  Person
//
//  Created by Xiulan Shi on 6/22/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//  Code by Xiulan Shi
/*
 Write a method called checkSameCity which accepts one parameter of type Person * and checks if they live in the same city. The method should return a boolean value.
 A Person has recently had a child, whose name is 'Abc'. Write a method called registerChild which takes 0 parameters and returns a new Person * instance represeting the child, which has the same phoneNumber and city as the parent.
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject

-(void)setCity:(NSString *)city;
-(NSString *)city;

-(void)setPhoneNumber:(NSString *)phoneNumber;
-(NSString *)phoneNumber;

-(void)setName:(NSString *)name;
-(NSString *)name;

- (void)changePersonsName:(Person *)aPerson
                   toName:(NSString *)newName;

- (BOOL) checkSameCity:(Person *)aPerson;
-(Person *)haveChild;
@end

@implementation Person {
    NSString *_city;
    NSString *_phoneNumber;
    NSString *_name;
}

-(void)setCity:(NSString *)city {
    _city = city;
}
-(Person *)haveChild{
    Person *child = [[Person alloc]init];
    [child setCity:[self city]];
    [child setPhoneNumber:[self phoneNumber]];
    
    return child;
}

-(NSString *)city {
    return _city;
}

-(void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

-(NSString *)phoneNumber {
    return _phoneNumber;
}

-(void)setName:(NSString *)name {
    _name = name;
}

-(NSString *)name {
    return _name;
}

- (void)changePersonsName:(Person *)aPerson
                   toName:(NSString *)newName {
    
    [aPerson setName:newName];
}

- (BOOL) checkSameCity:(Person *)aPerson {
    if ([[aPerson city] isEqualToString:[self city]]) {
        return YES;
    } else {
        return NO;
    }
    
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // no
        NSLog(@"Homework, redone");
        
        Person *carl = [[Person alloc] init];
        Person *mike = [[Person alloc] init];
        
        [carl setName:@"Carl"];
        
        [carl setCity:@"Okinawa"];
        [mike setCity:@"New York"];
        
        BOOL citiesAreSame = [mike checkSameCity:carl];
        NSLog(@"%d", citiesAreSame);
        
        [carl setPhoneNumber:@"867-5309"];
        
        NSString *carlsName = [carl name];
        
        NSLog(@"%@", carlsName);
        
        [carl setName:@"Steven"];
        
        NSLog(@"%@", [carl name]);
        
        NSLog(@"%@", [carl city]);
        
        [carl setCity:@"New York"];
        NSLog(@"%@", [carl city]);
        
        [mike changePersonsName:carl toName:@"Carl"];
        
        NSLog(@"%@", [carl name]);
        
        citiesAreSame = [mike checkSameCity:carl];
        NSLog(@"%d", citiesAreSame);
        
        Person *mikesBaby = [mike haveChild];
        NSLog(@"%@", [mikesBaby city]);
        //  [mikesBaby setName:@"Abc"];
        [mike changePersonsName:mikesBaby toName:@"Abc"];
        NSLog(@"%@", [mikesBaby name]);
    }
    return 0;
}

//#import <Foundation/Foundation.h>
//
//@interface Person: NSObject
//
//- (void)setName:(NSString *)name;
//- (NSString *)name;
//
//- (void)setCity:(NSString *)city;
//- (NSString *)city;
//
//- (void)setPhoneNumber:(NSString *)phoneNumber;
//- (NSString *)phoneNumber;
//
//// create a method called checkSameCity and it would return a boolean value (BOOL).
//- (BOOL)checkSameCity:(Person *)person;
//
//// create a method called registerChild which takes 0 parameters and returns a new Person * instance.
//- (Person *)registerChild;
//
//@end
//
//@implementation Person {
//    NSString *_name;
//    NSString *_phoneNumber;
//    NSString *_city;
//}
//
//- (void)setName:(NSString *)name {
//    _name = name;
//}
//
//- (NSString *)name {
//    return _name;
//}
//
//- (void)setCity:(NSString *)city {
//    _city = city;
//}
//
//- (NSString *)city {
//    return _city;
//}
//
//- (void)setPhoneNumber:(NSString *)phoneNumber {
//    _phoneNumber = phoneNumber;
//}
//
//- (NSString *)phoneNumber {
//    return _phoneNumber;
//}
//
////define the method checkSameCity (give the actual code). start by the type of method (instance), its return type (BOOL), and its arguments and their types.
//- (BOOL)checkSameCity:(Person *)person {
//    //if they live in the same city, it will print out YES and return YES. Otherwise, NO.
//    if([_city isEqualToString:[person city]]) {
//        NSLog(@"YES");
//        return YES;
//    } else {
//        NSLog(@"NO");
//        return NO;
//    }
//}
//
////define the method registerChild. start by the type of method (instance), its return type (Person *), and it's arguments and their types.
//- (Person *)registerChild {
//    //create an instance of a Person called child and initialize it
//    Person *child = [[Person alloc] init];
//
//    //setName to "Abc"
//    [child setName:@"Abc"];
//    //setPhoneNumber to the parent's phoneNumber
//    [child setPhoneNumber:_phoneNumber];
//    //setCity to the parent's city
//    [child setCity:_city];
//
//    //print out the child's name, phonenumber and city by using NSLog
//    NSLog(@"The Child's name is %@. Phone number is %@. City is %@.",child.name, child.phoneNumber, child.city);
//    return child;
//}
//@end
//
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        //create an instance of a Person called personA and initialize it
//        Person *personA = [[Person alloc] init];
//
//        //setName, setCity and setPhoneNumber for personA
//        [personA setName:@"John"];
//        [personA setCity:@"NewYork"];
//        [personA setPhoneNumber:@"7188202805"];
//
//        //create an instance of a Person called personB and initialize it
//        Person *personB = [[Person alloc] init];
//
//        //setName, setCity and setPhoneNumber for personB
//        [personB setName:@"Angel"];
//        [personB setCity:@"NewYork"];
//        [personB setPhoneNumber:@"7188202805"];
//
//        //use checkSameCity to check if they live in the same city.
//        [personB checkSameCity:personA];
//
//        //use registerChild to print out the child's name, phone number and city.
//        [personA registerChild];
//
//    }
//    return 0;
//}
