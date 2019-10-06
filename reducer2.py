#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import re
import sys
from collections import defaultdict
top={}
top = defaultdict(list)
timee=[]
for line in sys.stdin:
    line=line.strip('\n')
    num,ip=line.split('\t')
    time=re.findall('([[0-9]+:[0-9]+])',ip)
    value=re.findall(']([0-9].\S+[0-9])',ip)
    for i in range(len(time)):
        top[time[i]].append(value[i])
    for time in top.keys():
        if len(top[time])>=3 and time not in timee:
            timee.append(time)
            print(time,top[time])
        else:
            continue

