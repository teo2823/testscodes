/*
lobster --pak teo2823.lobster
*/

import std

def reverse_string(s: string, i: int, reversed: string) -> string:
    if i < 0:
        return reversed
    else:
        let char = substring(s, i, 1)
        let uptReversed = replace_string(reversed, " ",char, 1)
        return reverse_string(s, i - 1, uptReversed)

def r_string(s: string) -> string:
    let len = length(s)
    return reverse_string(s, len - 1, repeat_string(" ", len) )

def main():
    let arr_str= tokenize(get_line(" ")," ", " ")
    let conect_str = concat_string(arr_str, "\t")
    let rever_str = r_string(conect_str)
    let quit_space = rever_str.replace_string("\t", " ")
    print(quit_space)
main()

/*
cat DATA.lst | lobster teo2823.lobster
peek tnecsednacni sutcac yats nrut kcip eraf dna no tuoba
*/