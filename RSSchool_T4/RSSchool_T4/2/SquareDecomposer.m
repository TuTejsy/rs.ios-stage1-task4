#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
//    NSArray <NSNumber*> *result = @[];
//    NSArray *uniqueArray = @[];
//
//    int step = 0;
//    int delta = 0;
//
//    do {
//        int intNumber = [number intValue];
//        int prevVal = intNumber - 1;
//        result = @[@(prevVal)];
//
//        int sum = pow(intNumber, 2);
//
//        while(sum > 0) {
//            sum -= pow(prevVal, 2);
//            prevVal = sqrt(sum) - delta;
//
//            if (prevVal > 0) {
//                result = [@[@(prevVal)] arrayByAddingObjectsFromArray:result];
//            }
//
//            if (delta > 0) {
//                delta--;
//            }
//        }
//
//        uniqueArray = [result valueForKeyPath:@"@distinctUnionOfObjects.self"];
//
//    } while ([uniqueArray count] < [result count]);
//
//    return result;
    return nil;
}
@end
