%lang starknet

from starkware.cairo.common.alloc import alloc

// Fibonacci Sequence - 1, 1, 2, 3, 5, 8, 13
@external
func fibonacci(n : felt) -> (result : felt){
    alloc_locals;
    if (n == 0){
        return (result=0);
    }
    if (n == 1){
        return (result=1);
    }
    let (local x) = fibonacci(n - 1);
    let (local y) = fibonacci(n - 2);
    return (result=x + y);
}

// [1, 2, 3] -> [1, 2, 3]
// Finding a needle(number) in the haystack(array)
@external
func contains(needle : felt, haystack_len : felt, haystack : felt*) -> (result : felt){
    if (haystack_len == 0){
        return (result=0);
    }
    if (haystack[0] == needle){
        return (result=1);
    }
    let (contained) = contains(needle, haystack_len - 1, haystack + 1);
    return (result=contained);
}