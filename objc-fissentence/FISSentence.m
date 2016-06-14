//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Lloyd W. Sykes on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (strong, nonatomic, readwrite) NSString *sentence;

- (void)assembleSentence;
- (BOOL)validWord:(NSString *)word;
- (BOOL)validPunctuation:(NSString *)punctuation;
- (BOOL)validIndex:(NSUInteger)index;


@end

@implementation FISSentence

- (void)addWord:(NSString *)word; {
    
    // Now, add logic to the `addWord:` method that validates that the `word` argument string meets certain expectations: it cannot be `nil`, an empty string (`@""`), or a string with only a space in it (`@" "`). **Make sure that the `assembleSentence` method still gets called every time** (i.e. don't wrap the protections around the call of `assembleSentence`; instead, protect changing the data that `assembleSentence` relies upon). Get all of the tests for this method to pass.
    
    if ([self validWord:word]) {
        
        [self.words addObject:word];
        
    }
    
    [self assembleSentence];
    
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation; {
    
    /* 1. The `addWords:withPunctuation:` method should add the strings in the `words` *argument* array to the end of the `words` *property* array, and it should overwrite the string in the `punctuation` *property* with the `punctuation` *argument* string.
     * Add checks that the `words` argument array is neither `nil` nor an `empty` array. If it is, then the method should do nothing.
     **Hint:** *Use a* `return;` *statement to escape the method implementation if either case is true.*
     
     * Write validation logic that checks that the `punctuation` argument string is one of these seven (7) characters: `.?!,;:—` (period, question mark, exclamation point, comma, semicolon, colon, and long-dash).
     **Hint:** *It's not in the reference documentation, but* `NSString` *has a* `containsString:` *method that may be useful.*
     If the `punctuation` argument is invalid, then this method should do nothing.
     **Hint:** *Use another* `return;` *statement to escape the method implementation if the check fails.*
     
     * Use the `validWord:` method inside a loop to avoid adding any strings to the `words` property array that are empty string or spaces. At this point, all of the tests for this method should pass.
     
     * Move the validation logic of the `punctuation` argument string into the `validPunctuation:` method. Refactor the `addWords:withPunctuation:` method to use this method to perform its check. Verify that the tests for `addWord:withPunctuation:` still pass before moving on.
     
     */
    
    if (![self validPunctuation:punctuation] || [words isEqualToArray:@[ ]] || words == nil ) {
        // If the punctuation ISN'T valid OR the words array is the same as an empty array "@[ ]" OR the words array is nil return nothing.
        // NOTE HOW TO CHECK FOR NIL! object == nil NEVER NIL!
        
        return;
        
    }
    
    for (NSString *word in words) {
        
        if ([self validWord:word]) {
            
            [self.words addObject:word];
            // If the word is valid (along with the conditions of the above if statement outside of the loop), add the word to the self.words property.
            
        }
        
    }
    
    [self replacePunctuationWithPunctuation:punctuation];
    // Straightforward part of the test to ensure the punctuation property equals the punctuation argument string. What I decided to do though, was call the method I wrote replacePunctuationWithPunctuation (can alse be done self.punctuation = punctuation;
    
    [self assembleSentence];
    // Need to call the assembleSentence method everytime to ensure the sentence is put together correctly.
    
}

- (void)removeWordAtIndex:(NSUInteger)index; {
    
    /*2. The `removeWordAtIndex:` method should remove the string from the `words` property array at the index position specified by the `index` argument.
     * Add in a check the makes sure that the `index` argument is not beyond the bounds of the `words` property array. Verify that all of the tests pass for this method.
     * Move the validation logic of the `index` argument into the `validIndex:` method. Refactor `removeWordAtIndex:` to use `validIndex:` to perform the check. Verify that all of the tests for `removeWordAtIndex:` continue to pass before moving on.
     */
    
    if ([self validIndex:index]) {
        
        [self.words removeObjectAtIndex:index];
        
    }
    
    [self assembleSentence];
    
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index; {
    
    /* 3. The `insertWord:atIndex:` method should insert the submitted `word` string argument into the `words` property array at the position specified bye the `index` argument. Use the private validation methods `validWord:` and `validIndex:` to perform checks on the method arguments. The `insertWord:atIndex:` method should only attempt to change the properties if both arguments pass validation.
     */
    
    if ([self validWord:word] && [self validIndex:index]) {
        // I was making the "valid" methods == 1 when I realized that I can just place the method as is to represent "True" or utilize the ! in front to represent "False".
        
        [self.words insertObject:word atIndex:index];
        
    }
    
    [self assembleSentence];
    
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation; {
    
    /* 4. The `replacePunctuationWithPunctuation:` method should overwrite the string in the `punctuation` property string with the new `punctuation` argument string. This method should only attempt to make the change if the new `punctuation` argument string passes validation.
     */
    
    if ([self validPunctuation:punctuation]) {
        
        self.punctuation = punctuation;
        
    }
    
    [self assembleSentence];
    
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word; {
    
    /* 10. The `replaceWordAtIndex:withWord:` method should overwrite the string in the `words` property array at the position specified by the `index` argument with the new `word` argument string. This method should not attempt to make an overwrite unless the `word` argument passes the `validWord:` check and the `index` argument passes the `validIndex:` argument.
     */
    
    if ([self validWord:word] && [self validIndex:index]) {
        
        [self.words replaceObjectAtIndex:index withObject:word];
        
    }
    
    [self assembleSentence];
    
}

- (void)assembleSentence; {
    
    //Should read the 'words' property array and the 'punctuation' property string and assemble their contents into a properly formatted sentence. Save the string to 'sentence'
    
    self.sentence = [self.words componentsJoinedByString:@" "];
    // This pulls the objects out of the self.words array that are separated by a space (@" ") and places them all in a string.
    
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    // Appending the punctuation to the sentence string
    
}

- (BOOL)validWord:(NSString *)word; {
    
    // 4. Finally, move the validation logic for this check into the private `validWord:` methods. Refactor the `addWord:` method to call this validation method instead of doing the check itself. This will allow other methods to use the same uniform validation logic without having to copy/paste the code. Verify that `addWord:` still passes all of its tests before moving on.
    
    BOOL wordValid = 0;
    
    if (word != nil && ![word isEqualToString:@""]&& ![word isEqualToString:@" "]) {
        // If the word is not nil AND the string is not empty (@"") AND the string is not a space (@" ") wordValid is True.
        
        wordValid = 1;
        
    }
    
    return wordValid;
    
}

- (BOOL)validPunctuation:(NSString *)punctuation; {
    
    BOOL punctuationValid = 0;
    
    NSArray *punctuations = @[@"!", @"?", @".", @",", @";", @":", @"-"];
    
    if (punctuation != nil && [punctuations containsObject:punctuation]) {
        // If the string punctuation isn't nil AND the array punctuations (created two lines above) containsObject:punctuation (from the argument string) than punctuationValid is True!
        
        return 1;
        
    }
    
    return punctuationValid;
    
}

- (BOOL)validIndex:(NSUInteger)index; {
    
    BOOL indexValid = 0;
    
    if (index <= [self.words count] - 1) {
        // [self.words count] actually returned 10 which made it out of bounds to the NSUInteger index which is 9. Tis why I added - 1.
        
        indexValid = 1;
        
    }
    
    return indexValid;
    
}

@end
