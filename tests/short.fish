@echo === short options ===

@test "without a value" (
    getopts -a -b -c | string join " "
) = "a true b true c true"

@test "implicit and explicit values" (
    getopts -a 1 -b2 -c three | string join " "
) = "a 1 b 2 c three"

@test "repeating" (
    getopts -aba -bab -abc | string join " "
) = "a true b true a true b true a true b true a true b true c true"

@test "clustered" (
    getopts -abc -xyz foo bar -p.. -q.5 | string join " "
) = "a true b true c true x true y true z foo _ bar p .. q .5"

@test "mixed boolean, string, and numbers" (
    getopts -abb -c3.141592 foo -dde bar -x -z | string join " "
) = "a true b true b true c 3.141592 _ foo d true d true e bar x true z true"

@test "non-alphabetic characters" (
    getopts -abc\$100.00 -x./ -y2k -z@foo | string join " "
) = "a true b true c \$100.00 x ./ y 2k z @foo"
