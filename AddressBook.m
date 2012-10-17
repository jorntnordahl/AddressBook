//
//  AddressBook.m
//  AddressBook
//
//  Created by Jorn Nordahl on 10/15/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

//this code is no longer needed by the obj c compiler
//also if you use a custom getter for book you would not want to synthesize it at all
//if its read only
@synthesize book, bookName;

-(id) initWithName: (NSString *) name
{
    self = [super init];
    //this if check is obj C convention and "correct"
    //I also think its a bit idiotic because its basically a call to malloc()
    //if malloc ever fails in your app it crashes
    //so I normally dont bother with this if block because it seems completely vague
    //and useless since returning nil from a constructor is completely stupid
    if (self)
    {
//again NSString is immutable
//another difference - when you use "retain" or "strong semantics"
//if you access the property directly through the generated field
//you are basically bypassing your memory management
//so you declared bookName to be strong - but its not retained
//because you set the field directly
//correct usage to get the automatic retain or strong would be
//self.bookName = name;
//the generated setter does the retain
//if you wanted to access the field directly and retain the value
//you would have to write bookName = [name retain];
//which defeats the purpose of delcaring your property as retained in the first place
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
    }
    
    return self;
}

//you should probably ditch this constructor
//obj C has this wierd convention of the "designated" constructor
//Ill admit its confusing, but whats going on here is you are allowing
//a call to the non-designated constructor and building a half baked object
//subjectively it would be better to leave out this constructor and
//if the behavior is really needed just past nil to the designated constructor
//personally I dont know if I even buy the designated constructor convention in obj c
//but it is a convention supposedly
//what you implemented here is a "default" constructor - not the same
//and I generally avoid it in obj C 
-(id) init
{
    return [self initWithName:@"NoName"];
}

-(void) addCard: (AdressCard *) theCard
{
    [book addObject:theCard];
}

-(void) removeCard: (AdressCard *) theCard
{
    [book removeObject:theCard];
}



-(NSUInteger) entries
{
    return [book count];
}

-(void) list
{
    if ([book count] > 0)
    {
        for (AdressCard *theCard in book)
        {
            [theCard print];
        }
    }
    else
    {
        NSLog(@"Address Book is empty...");
    }
}

-(AdressCard *) lookup: (NSString *) theName
{
    for (AdressCard *nextCard in book)
    {
        if ( [nextCard.name caseInsensitiveCompare:theName] == NSOrderedSame)
        {
            return nextCard;
        }
    }
    
    return nil;
}

-(void) sort
{
    [book sortUsingSelector:@selector(compareNames:)];
    
    
    //[book sortUsingComparator:^NSComparisonResult(AdressCard *obj1, AdressCard *obj2) {
    //    return [obj1.name compare: [obj2.name]];
    //}];
}

//since you have no dealloc Im assuming this is an ARC project
//I think ARC takes care of dealloc for you but I really dont know
-(void) dealloc
{
//one thing to note here is pretty important in dealloc methods
//if you go through the property and set it to nil - 
//the generated setter will call release on the existing object and then set the property to nil
//if the existing object is nil calling release on it is fine - it just returns nil and moves on
  self.bookName = nil;
//however if you access the generated field directly
//you must do two calls to make the object release properly
//  [bookName release];
//  bookName = nil; <-- if you dont do this obj C will screw you
//there is some magic in the autorelease pool code that if you dont set the object to nil
//it may not be "drained" from the pool so if you release using the field you must always do this
//using the property is less code and cleaner

  //self.book = nil; <-- not allowed its a readonly prop
  [book release];
  book = nil;
}

@end
