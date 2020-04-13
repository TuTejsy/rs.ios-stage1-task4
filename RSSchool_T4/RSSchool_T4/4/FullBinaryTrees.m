#import "FullBinaryTrees.h"
#import "Node.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0) {
        return @"[]";
    }
    
    NSArray<Node *> *treesList = [self getTreesListForCount:count];
    NSString *treesListStringRepresentation = [self getStringRepresentationOfTreesList:treesList];
   
    return treesListStringRepresentation;
}

- (NSArray<Node *> *)getTreesListForCount:(NSInteger)count {
    NSArray<Node *> *nodesList = @[];
    
    if (count == 1) {
        Node *node = [[Node alloc] init];
        nodesList = [nodesList arrayByAddingObject:node];
    } else {
        for (int i = 0; i < count; i++) {
            NSArray<Node *> *leftNodes = [self getTreesListForCount:i];

            for (Node *leftNode in leftNodes) {
                NSArray<Node *> *rightNodes = [self getTreesListForCount:(count - 1 - i)];

                for (Node *rightNode in rightNodes) {
                    Node *node = [[Node alloc] init];
                    node.left = leftNode;
                    node.right = rightNode;

                    nodesList = [nodesList arrayByAddingObject:node];
                }
            }
        }
    }
    
    return nodesList;
}

- (NSString *) getStringRepresentationOfTreesList: (NSArray<Node*> *) TreesList {
    NSMutableString* stringRepresentation = [@"[" mutableCopy];
    
    for (Node *rootNode in TreesList) {
        NSMutableArray<NSString *> *TreeStages = [@[@"0"] mutableCopy];
        
        NSArray *prevStageNodes = @[rootNode];
        NSMutableArray *stageNodes = [@[] mutableCopy];
        
        while([prevStageNodes count] > 0) {
            for (Node* prevNode in prevStageNodes) {
                    if (prevNode.left) {
                        [TreeStages addObject:prevNode.left.value];
                        [stageNodes addObject:prevNode.left];
                    } else {
                        [TreeStages addObject:@"null"];
                    }
                    
                    if (prevNode.right) {
                        [TreeStages addObject:prevNode.right.value];
                        [stageNodes addObject:prevNode.right];
                    } else {
                        [TreeStages addObject:@"null"];
                    }
                }
            
            prevStageNodes = [stageNodes copy];
            stageNodes = [@[] mutableCopy];

        };
        
        NSInteger trailingNullsCount = 0;
        NSInteger i = [TreeStages count] - 1;
        
        while ([TreeStages[i] compare:@"0"] != NSOrderedSame) {
            i--;
            trailingNullsCount++;
        }
        
        [TreeStages removeObjectsInRange:NSMakeRange(i + 1, trailingNullsCount)];
        
        [stringRepresentation appendString:@"["];
        
        for (NSString* stringNode in TreeStages) {
            [stringRepresentation appendString: stringNode];
            [stringRepresentation appendString: @","];
        }
        [stringRepresentation deleteCharactersInRange:NSMakeRange(stringRepresentation.length - 1, 1)];
        
        [stringRepresentation appendString:@"],"];
    }
    [stringRepresentation deleteCharactersInRange:NSMakeRange(stringRepresentation.length - 1, 1)];
    
    [stringRepresentation appendString:@"]"];
    return [stringRepresentation mutableCopy];
}


@end
