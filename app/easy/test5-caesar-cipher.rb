
# Julius Caesar protected his confidential information by encrypting it using a cipher.
# Caesar's cipher shifts each letter by a number of letters.
# If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet.
# In the case of a rotation by 3, w, x, y and z would map to z, a, b and c.

# Original alphabet:      abcdefghijklmnopqrstuvwxyz
# Alphabet rotated +3:    defghijklmnopqrstuvwxyzabc

# Example
# s = There's-a-starman-waiting-in-the-sky
# k = 3

# Result
# Wkhuh'v-d-vwdupdq-zdlwlqj-lq-wkh-vnb

def caesarCipher(s, k)
    result = ""

    k = k % 26 if k > 26
    
    s.each_char do |char|
        is_upcase = char == char.upcase
        char.downcase!
        
        ciphered_char = cipher(char, k)
        ciphered_char.upcase! if is_upcase
        
        result += ciphered_char
    end
    
    result
end

def cipher(char, rotation)
    # main idea is to use ascii integer byte format to determine rotation
    # lowercase alphabet ASCII integer is between 97 - 122

    ciphered_char_byte = char.ord
    return char unless ciphered_char_byte.between?(97, 122)
    
    ciphered_char_byte += rotation
    ciphered_char_byte -= 26 if ciphered_char_byte > 122
    
    ciphered_char_byte.chr
end

s = "There's-a-starman-waiting-in-the-sky"
k = 3
p caesarCipher(s, k) # expected output Wkhuh'v-d-vwdupdq-zdlwlqj-lq-wkh-vnb