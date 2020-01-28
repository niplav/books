a={}
a.a=a

# a.a.a.a evaluates to the table a
# the first a is a pointer to the table a,
# the other a's are all keys
# the expression can be rewritten as
# a["a"]["a"]["a"]

a.a.a.a=3

# the now the value for the key "a" is 3 in
# the table a, so a.a is 3, and a.a.a is not
# indexable, since 3 has no field called "a".
# So lua prints an error message.
