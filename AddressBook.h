//
//  AddressBook.h
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdressCard.h"

@interface AddressBook : NSObject

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;
@property (nonatomic, strong) NSMutableDictionary *cards;

-(id) initWithName: (NSString *) name;
-(void) addCard: (AdressCard *) theCard;
-(void) removeCard: (AdressCard *) theCard;
-(NSUInteger) entries;
-(void) list;
-(AdressCard *) lookup: (NSString *) theName;
-(void) sort;

@end
