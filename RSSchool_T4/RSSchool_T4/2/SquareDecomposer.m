#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSArray <NSNumber*> *result = @[];

    if ([number intValue] < 5) {
        return nil;
    }
    
    NSUInteger pos = 0;
    NSUInteger delta1 = 0;
    NSUInteger delta2 = 0;
    NSUInteger delta3 = 0;
    BOOL isOk = YES;

    do {
        NSUInteger intNumber = [number intValue];
        NSUInteger prevVal = intNumber - 1;
        result = @[@(prevVal)];
        isOk = YES;
        NSUInteger sum = pow(intNumber, 2);
        
        NSUInteger i = 0;
        while(sum > 0) {
            sum -= pow(prevVal, 2);
            prevVal = sqrt(sum);
            
            if (i < pos) {
                if (i == 0) {
                    prevVal -= delta1;
                } else if (i == 1){
                    prevVal -= delta2;
                } else {
                    prevVal -= delta3;
                }
            }
            
            if (prevVal >= [result[0] intValue]) {
                isOk = NO;
                break;
            }

            if (prevVal > 0) {
                result = [@[@(prevVal)] arrayByAddingObjectsFromArray:result];
            }
            
            i++;
        }
        
        pos++;
        if (pos == 5) {
            pos = 1;
            if (delta3 > delta2) {
                delta3 = 0;
                if (delta2 > delta1) {
                    delta2 = 0;
                    delta1++;
                } else {
                    delta2++;
                }
            } else {
                delta3++;
            }
        }
    } while (!isOk || [result count] == 1);

    return result;
}
@end
