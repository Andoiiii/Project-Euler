def sum_of_n_nats(n):
    return (n * (n+1)) / 2

def sum_of_n_squares(n):
    return (n * (n+1) * (2*n+1)) / 6

print(abs(sum_of_n_squares(100) - sum_of_n_nats(100) ** 2))