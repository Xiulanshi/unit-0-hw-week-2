//
//  main.m
//  Election
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//


#import <Foundation/Foundation.h>

// forward declarations
@class Contender;
@class Election;

// Contender class
@interface Contender : NSObject

- (instancetype)initWithName:(NSString *)name;
    
- (void)addVote;
- (NSInteger)votesReceived;
- (NSString *)name;

@end

@implementation Contender {
    NSInteger _votesReceived;
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _votesReceived = 0;
        _name = name;
        return self;
    }
    return nil;
}

- (void)addVote {
    _votesReceived++;
}

- (NSInteger)votesReceived {
    return _votesReceived;
}

- (NSString *)name {
    return _name;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ received %ld votes", _name, _votesReceived];
}

@end


@interface Election : NSObject

- (instancetype)initWithElectionName:(NSString *)name;

- (void)setElectionName:(NSString *)name;
- (NSString *)electionName;

- (void)addContender:(Contender *)contender;
- (void)vote;
- (void)vote:(NSInteger)index;
- (void)displayCandidates;
- (void)displayResults;

@end


// Election class
@implementation Election {
    NSString *_electionName;
    NSMutableArray *_listOfContenders;
}

- (instancetype)initWithElectionName:(NSString *)name {
    if (self = [super init]) {
        _electionName = name;
        return self;
    }
    return nil;
}

- (void)addContender:(Contender *)contender {
   if (_listOfContenders == nil) {
       _listOfContenders = [[NSMutableArray alloc] init];
   }
    [_listOfContenders addObject:contender];
}

- (void)setElectionName:(NSString *)name {
    _electionName = name;
}

- (NSString *)electionName {
    return _electionName;
}

- (void)vote:(NSInteger)index {
    Contender *contender = (Contender *)[_listOfContenders objectAtIndex:index];
    [contender addVote];
}

- (void)displayCandidates {
    for (Contender *c in _listOfContenders) {
        NSLog(@"%@", [c name]);
    }
}


- (void)displayResults {
    printf("\n%s\n", [_electionName UTF8String]);
    for (Contender *c in _listOfContenders) {
        printf("%s\n", [[c description] UTF8String]);
    }
}

- (void)vote {
    NSInteger i = 1;
    
    for (Contender *c in _listOfContenders) {
        printf("\nIndex = %ld, Contender = %s", i, [[c name] UTF8String]);
        i++;
    }
    
    printf("\n");
    
    BOOL voted = NO;
    
    while (!voted) {
        printf("\nEnter the index of the Contender you want to vote for: ");
        int vote;
        scanf("%d", &vote);
        
        int index = vote - 1;
        
        if (index >= 0 && index < _listOfContenders.count) {
            [self vote:index];
            voted = true;
        } else {
            printf("Contender does not exist...\n");
        }
    }
        
}

@end


// ElectionManager class
@interface ElectionManager : NSObject

- (void)manage:(Election *)race;
- (void)initiatePolling;
- (void)displayResults;
- (BOOL)pollsOpen;

@end

@implementation ElectionManager {
    NSMutableArray *_races;
}

- (void)manage:(Election *)race {
    if (_races == nil) {
        _races = [[NSMutableArray alloc] init];
    }
    [_races addObject:race];
}

- (void)initiatePolling {
    while ([self pollsOpen]) {
        for (Election *race in _races) {
            printf("\nVOTE FOR ONE! \n");
            [race vote];
        }
    }
}

- (void)displayResults {
    printf("Results of voting...\n");
    for (Election *race in _races) {
        [race displayResults];
    }
}

- (BOOL)pollsOpen {
    printf("Type 0 to close polls otherwise enter 1 to continue: ");
    int answer;
    scanf("%d", &answer);
    fpurge(stdin);
    
    return answer != 0;
}


@end

// VotingSimulator class
@interface VotingSimulator : NSObject

-(void)simulate;

@end

@implementation VotingSimulator

-(void)simulate{

    //ask 1

//    index
//    int i = arc4random_uniform(4);
//    i++;
//    
//    ask
    
//    index
    
    
    
    
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Create an Election object, and given the Election a name
        Election *anElection = [[Election alloc] init];
        
        [anElection setElectionName:@"BESTAPP"];
        
        //Create a few Contender objects
        Contender *faceBook = [[Contender alloc] initWithName:@"facebook"];
        
        [faceBook name];
        
        
        Contender *weChat = [[Contender alloc] initWithName:@"weChat"];
        
        [weChat name];
        
        Contender *whatsApp = [[Contender alloc] initWithName:@"whatsApp"];
        
        [whatsApp name];
        
        Contender *slack = [[Contender alloc] initWithName:@"slack"];
        
        [slack name];
        
        Contender *twitter = [[Contender alloc] initWithName:@"twitter"];
        
        [twitter name];
        
        //add these contenders to Election object
        
        [anElection addContender:faceBook];
        [anElection addContender:weChat];
        [anElection addContender:whatsApp];
        [anElection addContender:slack];
        [anElection addContender:twitter];
        
        //create a ElectionManager object
        
        ElectionManager *anElectionManager = [[ElectionManager alloc] init];
        //ask ElectionManager to manage the Election object
        [anElectionManager manage:anElection];
        //ask ElectionManager to initiatePolling
        [anElectionManager initiatePolling];
        //ask ElectionManager to displayResults
        [anElectionManager displayResults];
        
        
        
    }
    return 0;
}
/* You are given 3 classes
 
 ElectionManager
 Conducts an election.
 Controls start of voting
 Election
 Maintains a list of contenders
 Contender
 Represents details about a contender
 What is the contender's name?
 How many votes has he received?
 Write a program to simulate an election. Create a class called VotingSimulator. In the main , you are required to do the following:
 
 Create an Election object, and given the Election a name
 Create a few Contender objects. Add these to the Election object. Make sure that the contender names are distinct!
 Create a ElectionManager object. Ask it to manage the Election object created above.
 Ask the ElectionManager to initiatePolling
 Follow the instructions on the console. After each round of polling you will be asked(within the console) whether you want to continue or not.
 Ask the ElectionManager to displayResults
 
 */

