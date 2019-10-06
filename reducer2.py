#!/usr/bin/env python
# coding: utf-8

# In[ ]:
import re
import sys
from collections import defaultdict
top={}
top = defaultdict(list)
h={}
h=defaultdict(list)
timee=[]
for line in sys.stdin:
    line=line.strip('\n')
    line=line.split('\t')  
    h[line[0]].append(line[1])
sorted_dd = sorted(d.keys(),reverse=True)
for k in sorted_dd:
    for i in d[k]:
        time=re.findall('([[0-9]+:[0-9]+])',i)
        time=str(time)
        value=re.findall(']([0-9]\S+)',i)
        value=str(value)
        top[time].append(value)
    for time in top.keys():
        if len(top[time])>=3 and time not in timee:
            timee.append(time)
            print(time,top[time])
        else:
            continue
