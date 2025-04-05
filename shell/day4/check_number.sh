#/bin/bash

echo "Enter a number"
read num
if [ $num -gt 0 ]; then
        echo "Postive Number"
elif [ $num -lt 0 ]; then
        echo "Negative Number"
else
        echo "Zero"
fi
