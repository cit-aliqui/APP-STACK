import json
import re 
json_as_string = open('sample.json', 'r')
# Call this as a recursive function if your json is highly nested
lines = [re.sub("[\[\{\]]*","",one_object.rstrip()) for one_object in json_as_string.readlines()]
json_as_list = "".join(lines).split('}')
print json_as_list
