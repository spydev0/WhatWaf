#!/bin/bash

chmod +x whatwaf.py
mkdir /usr/local/etc/whatwaf
cp -R ./* /usr/local/etc/whatwaf
python -c '
import os;
import stat;
with open("/usr/local/bin/whatwaf","a+") as whatwaf:
    whatwaf.write("#!/bin/bash\n# this is the execution script for whatwaf\n# created by the whatwaf installer on ${DATE}\ncd /usr/local/etc/whatwaf\nexec python whatwaf.py $@");
st=os.stat("/usr/local/bin/whatwaf");
os.chmod("/usr/local/bin/whatwaf",st.st_mode | stat.S_IEXEC)
'
chmod +x /usr/local/bin/whatwaf
pip install -r requirements.txt
