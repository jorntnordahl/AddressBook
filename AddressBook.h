//
//  AddressBook.h
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

//Jorn just putting some questions in comments - I know this is out of a book
//so I just want to annotate some thoughts on the code.


#import <Foundation/Foundation.h>
#import "AdressCard.h"

@interface AddressBook : NSObject

//NSString is an immutable object why copy it?
@property (nonatomic, copy) NSString *bookName;

//exposing the book as an array is ok saves you having to create your own iterator
//but it should be readonly in general to allow the mutator methods to do the mutations
//also you want ot expose it as NSArray externally even though its actually mutable internally
//yes a dev can cast around it but thats a bad practice
//so maybe instead @property(nonatomic, retain, readonly, getter=book) NSArray *book;
//there will be no setter and you can create the internal NSMutableArray * as a field
//and return it as NSArray in your custom getter
@property (nonatomic, strong) NSMutableArray *book;

-(id) initWithName: (NSString *) name;
-(void) addCard: (AdressCard *) theCard;
-(void) removeCard: (AdressCard *) theCard;
-(NSUInteger) entries;
-(void) list;
-(AdressCard *) lookup: (NSString *) theName;
-(void) sort;

@end
