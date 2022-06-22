#!/bin/bash
cat $1 | awk '{print $1}'  | sort -nr | uniq -c | sort -nr | head -1 | awk '{print "1. Most requests is from "$2" ip"}'
cat $1 | awk '$9 == 200 {print $7}' | sort -nr | uniq -c | sort -nr | head -1 | awk '{print "2. The most requested page is: "$2}'
echo "3. Requests by ip:"
cat $1 | awk '{print $1}'  | sort -nr | uniq -c
echo "4. Non existent pages"
cat $1 | awk '/error404/{print $7}' | sort -nr | uniq
cat $1 | awk '{print $4$5}'  | sort -nr | uniq -c | sort -nr | head -1 | awk '{print "5. Most requests was made at "$2}'
echo "6. Bots that accesed sites:"
cat $1 | awk '/bot/{print $14" "$16}'  | sort | uniq | awk '{print $1 $2}'