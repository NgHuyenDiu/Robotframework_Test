def transform_RGB_to_HEX(color):
    str1 = color.replace("rgb(", "")
    str = str1.replace(")", "")
    print(str)
    list_num = str.split(", ")
    print(list_num)
    hex_str = ''
    for num in list_num:
       num_hex= hex(int(num))
       num_hex = num_hex.replace("0x", "")
       hex_str += num_hex
    return hex_str.upper()