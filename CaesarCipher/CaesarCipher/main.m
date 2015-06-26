//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
/*
 The Roman General Julius Caesar used to correspond with his generals using a secret code. He devised a way of encrypting his messages using a simple encryption scheme now known as Caesar Cipher or Shift Cipher. You can read more about it here and watch a video here
 
 You are given a class called CaesarCipher with methods encode and decode
 Being amateur codebreakers, we want to know if two distinct looking ciphers correspond to the same input message. Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value which tells us whether they are actually the same input message encoded using two different offsets. hint: the maximum offset is 25
 There are multiple ways to do this. Try to come up with as many solutions as you can.
 Example:
 okmg = "mike", offset 2
 tprl = "mike", offset 7
 
 Both are the same input message, but different offset. Your method would return YES in this case
 */


#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
//create a method which returns a boolean value
- (BOOL)codeBreaker:(NSString *)message1 secondMessage:(NSString *)message2;
@end


@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);
        
        result[i] = allchars[new_idx];
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL)codeBreaker:(NSString *)message1 secondMessage:(NSString *)message2 {
    // message1
    // message2
    
    //   if ([message1 length] != [message2 length]) return NO; Do this check first, if the length is different then the result is NO and won't run the for loop. for efficieny purpose!!!
    if ([message1 length] != [message2 length]) {
        NSLog(@"The length is different, so they are different.");
        return NO;
    } else {
    // use for loop for one of messages to compare with the other one, if same return YES, otherwise return NO;
        for (int i = 0; i < 26; i++){
            if ([message1 isEqualToString:[self encode:message2 offset:i]]) {
                return YES;
            }
        }
    }
    return NO;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CaesarCipher *check = [[CaesarCipher alloc] init];
        
        //set message1 and message2, you can change them to anything you like.
        NSString *message1 = [check encode:@"This is a secret" offset:2];
        NSString *message2 = [check encode:@"This is not a secret" offset:7];
        //print out message1 and message2
        NSLog(@"The first message is %@", message1);
        NSLog(@"The second message is %@", message2);
        //create a bool to run the codeBreaker method for them
        BOOL checkSameText = [check codeBreaker:message1 secondMessage:message2];
        //print out the result
        NSLog(@"The result is %d. (where 1 means Yes, 0 means No.)", checkSameText);
        
        
    }
}
