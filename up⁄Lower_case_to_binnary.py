def analyze_string(string):
    result = ""
    for c in string:
        if c.isupper():
            result += "0"
        elif c.islower():
            result += "1"
    return result

print(analyze_string("HtmL heaD MEta MEta Meta lINK LiNk LiNK TiTlE TitLe heAd BODY heADer Div dIV A A DiV DiV DiV div NAv uL lI a A lI LI a a Li LI A A Li lI A a lI uL Nav HEADer DiV SEctiON h sPan sPaN H P P SECTION SECTION DIV H H"))