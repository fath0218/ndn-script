#call get-sys-info.py to refresh it and write the content into a text
#some other options like sysstat, lm-sensors can also finish this task

step=1

for ((i=1;i<3600;i=(i+step) )); do
python get-sys-info.py > result.txt
#date >> result.txt

sleep $step
done

exit 0
