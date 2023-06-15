#!/bin/bash

image=$1

date=$(date)

SUBJECT="<b>Notification for CI</b>"
BODY="Build Image done!
Here is some infomation:
<pre>
 Image version: $image

 Date : `date` $date 
</pre>

"
CHATID="-1001938067748" #ID group 
TOKEN="6281584523:AAFWm6sg-afrm7Lti-1slXDYXM7Bls7LlDk"

curl -s --data "chat_id=-1001938067748" --data-urlencode "text=HERE IS YOUR MESSAGE and VARIABLE VALUE TO SEND IN TELEGRAM ${stringholder}" "https://api.telegram.org/bot6281584523:AAFWm6sg-afrm7Lti-1slXDYXM7Bls7LlDk/sendMessage?parse_mode"


curl -s --data "chat_id=$CHATID" --data-urlencode "text=$SUBJECT
$BODY" "https://api.telegram.org/bot$TOKEN/sendMessage?parse_mode"
