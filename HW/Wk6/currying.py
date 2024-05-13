# Curried function
def add_n(n: int):
    print(f'add_n({n})({k})')
    return lambda k: n + k

k = 1
add_n = add_n(4)
print(add_n(k))

def curry(func):
    def curried(*args, **kwargs):
        if len(args) + len(kwargs) >= func.__code__.co_argcount:
            return func(*args, **kwargs)
        return lambda *args2, **kwargs2: curried(*(args + args2), **(kwargs | kwargs2))
    return curried

# Example of a curried function
@curry
def add(x, y, z):
    return x + y + z

# Partial application
add_5 = add(5)
add_5_and_3 = add_5(3)

# Result
result = add_5_and_3()
print(result(0))  # Output: 8
