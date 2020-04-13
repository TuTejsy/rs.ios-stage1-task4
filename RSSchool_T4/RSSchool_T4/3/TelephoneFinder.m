#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSDictionary *neighbors = @{
        @1: @[@2, @4],
        @2: @[@1, @3, @5],
        @3: @[@2, @6],
        @4: @[@1, @5, @7],
        @5: @[@2, @4, @6, @8],
        @6: @[@3, @5, @9],
        @7: @[@4, @8],
        @8: @[@7, @5, @9, @0],
        @9: @[@8, @6],
        @0: @[@8],
    };
    
    int numVal = [number intValue];
    if (numVal < 0) {
        return nil;
    }
    
    NSArray <NSString*> *result = @[];
    
    for (int i = 0; i < [number length]; i++) {
        int num = [[number substringWithRange:NSMakeRange(i, 1)] intValue];
        
        NSArray *numNeighbors = [neighbors objectForKey:@(num)];
        
        for (NSNumber *neighbor in numNeighbors) {
            NSString *numToAppend = [number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[neighbor stringValue]];
            
            result = [result arrayByAddingObject:numToAppend];
        }
        
    }
    return result;
}
@end
