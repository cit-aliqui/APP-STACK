#!/bin/python 

import pycurl
import json
from StringIO import StringIO
import sys

### Only to test List values
buffer = StringIO()
c = pycurl.Curl()
c.setopt(c.URL, 'http://35.231.156.222:8080/student-api/student/list')
c.setopt(c.WRITEFUNCTION, buffer.write)
c.perform()
c.close()
body = buffer.getvalue()
stat = json.loads(body)
stat_list = stat['httpStatus']


if stat_list >= 400 and stat_list < 500:
    message = stat['data']['message']
    print 'Test :: GET Students :: FAILURE'
    print '\tError -> ' + message
    #sys.exit(1)
else:
    print 'Test :: GET Students :: SUCCESS'


### Only to PUT values.

apiURL = 'http://35.231.156.222:8080/student-api/student/'
c = pycurl.Curl()
c.setopt(c.URL, apiURL)
c.setopt(pycurl.HTTPHEADER,['Content-Type: application/json'])
c.setopt(c.POSTFIELDS, '{ "studentName": "Meghan Mahadev", "studentAddr": "Hyderabad", "studentAge": "2", "studentQulaification": "Nursary", "studentPercent": "99%", "studentYearPassword": "2017" }')
c.setopt(c.WRITEFUNCTION, buffer.write)
c.perform()
c.close()
body = buffer.getvalue().replace('}}','}}|').split('|')
print body
#stat = json.loads(body)
sys.exit()
stat_put = stat['httpStatus']
if stat_put >= 200 and stat_put < 300:
    print 'Test :: PUT Students :: SUCCESS'
else:
    stat = json.loads(body[1])
    message = stat['data']['message']
    print 'Test :: PUT Students :: FAILURE'
    print '\tError -> ' + message
    sys.exit(1)

