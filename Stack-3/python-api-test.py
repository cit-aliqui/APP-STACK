#!/bin/python 

import pycurl
import json
from StringIO import StringIO
import sys

import urllib2
try: 
    response = urllib2.urlopen('http://10.142.0.2:8080/student-api/')
except urllib2.HTTPError, e:
    print 'Test :: Connection :: FAILURE'
    sys.exit()
except urllib2.URLError, e:
    print 'Test :: Connection :: FAILURE'
    sys.exit()
print 'Test :: Connection :: SUCCESS'

### Only to test List values
buffer = StringIO()
c = pycurl.Curl()
c.setopt(c.URL, 'http://10.142.0.2:8080/student-api/student/list')
c.setopt(c.WRITEFUNCTION, buffer.write)
c.perform()
c.close()
body = buffer.getvalue()
stat = json.loads(body)
stat_list = stat['httpStatus']
if stat_list >= 400 and stat_list < 500:
    message = stat['data']['message']
    print 'Test :: LIST Students :: FAILURE'
    print '\tError -> ' + message
    #sys.exit(1)
else:
    print 'Test :: LIST Students :: SUCCESS'


### Only to PUT values.

apiURL = 'http://10.142.0.2:8080/student-api/student/'
c = pycurl.Curl()
c.setopt(c.URL, apiURL)
c.setopt(pycurl.HTTPHEADER,['Content-Type: application/json'])
c.setopt(c.POSTFIELDS, '{ "studentName": "Meghan Mahadev", "studentAddr": "Hyderabad", "studentAge": "2", "studentQulaification": "Nursary", "studentPercent": "99%", "studentYearPassword": "2017" }')
c.setopt(c.WRITEFUNCTION, buffer.write)
c.perform()
c.close()
body = buffer.getvalue().replace('}}','}}|').split('|')[0]
## Adding this code for delete purpose
output = buffer.getvalue().replace('}}','}}|').split('|')
cc = len(output)
out1 = output[cc-2]+'}'
stat = json.loads(out1)
stat_id = stat['data']['object']['student_id']
##########


try:
    stat = json.loads(body)
except TypeError:
    body = buffer.getvalue().replace('}}','}}|').split('|')[1]
    stat = json.loads(body)
stat_put = stat['httpStatus']
if stat_put >= 200 and stat_put < 300:
    print 'Test :: ADD Student :: SUCCESS'
else:
    stat = json.loads(body[1])
    message = stat['data']['message']
    print 'Test :: ADD Student :: FAILURE'
    print '\tError -> ' + message
    sys.exit(1)

