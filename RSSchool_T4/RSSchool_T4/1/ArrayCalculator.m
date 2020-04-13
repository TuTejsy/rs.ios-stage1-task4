#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSArray<NSNumber*> *filteredArray = [array filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
        return [object isKindOfClass:[NSNumber class]];
    }]];
    
    if ([filteredArray count] == 0) {
        return 0;
    }
    
    NSInteger N = numberOfItems > [filteredArray count] ? [filteredArray count] : numberOfItems;
    
    filteredArray = [filteredArray sortedArrayUsingComparator:^NSComparisonResult(id left, id right) {
        int first = abs([left intValue]);
        int second = abs([right intValue]);
        return (second < first) ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    
    NSInteger result = 1;
    int lastNegative = 0;
    int lastPositive = 0;
    
    for (int i = 0; i < N; i++) {
        int number = [filteredArray[i] intValue];
        
        if (number < 0) {
            lastNegative = number;
        } else {
            lastPositive = number;
        }
        
        result *= number;
    }
    
    if ((result < 0) && (N < [filteredArray count])) {
        int negative = 0;
        int positive = 0;
        
        for (NSInteger i = N; i < [filteredArray count]; i++) {
            int number = [filteredArray[i] intValue];
            
            if (number < 0 && negative == 0) {
                negative = number;
            } else if (positive == 0) {
                positive = number;
            } else {
                break;
            }
        }
        
        if ((negative * lastNegative) > (positive * lastPositive)) {
            result /= lastPositive;
            result *= negative;
        } else {
            result /= lastNegative;
            result *= positive;
        }
    }
    
    return result;
}

@end
