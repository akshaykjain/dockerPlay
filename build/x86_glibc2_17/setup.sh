#!/bin/sh
#
yum install -y epel-release
yum install -y gcc libffi-devel bzip2 python-devel openssl-devel python-setuptools krb5-devel make zeromq-devel wget
# #install virutalenv
# easy_install pip
# pip install setuptools --upgrade
# pip install virtualenv
#
# virtualenv --download --no-wheel x86_glibc2_17
# source x86_glibc2_17/bin/activate
# pip install -r /prereq.txt
#
# cd x86_glibc2_17/
# packagesList=`find | grep 'x86_glibc2_17/bin/python' -r .`
# package=`echo "$packagesList" | awk '{print $1;}'`
# packageArray=( $package )
# for i in "${packageArray[@]}"; do
#     splitLine=$(echo $i | tr ":" "\n")
#     set -- $splitLine
#     sed -i 's/!\/x86_glibc2_17\/bin\/python/!\/usr\/bin\/env python/g' $1
# done
# cd ..
#
# tar czf  x86_glibc2_17.tar.gz  x86_glibc2_17


#!/bin/sh

# install miniconda
mkdir -p /opt/miniconda3/
wget -P /tmp/ https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Silent Install to prefix=/opt/miniconda3/
bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b -f -p /opt/miniconda3/

# add to path
echo 'export PATH="/opt/miniconda3/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

conda create -n jeg_base python=3.5 -y

source activate jeg_base

cd /

mv yarn_api_client-0.3.7.dev0-py2.py3-none-any.zip yarn_api_client-0.3.7.dev0-py2.py3-none-any.whl

pip install -r /prereq.txt

cd /opt/miniconda3/envs/jeg_base

packagesList=`find | grep '/opt/miniconda3/envs/jeg_base/bin/python' -r .`
package=`echo "$packagesList" | awk '{print $1;}'`
packageArray=( $package )
for i in "${packageArray[@]}"; do
    splitLine=$(echo $i | tr ":" "\n")
    set -- $splitLine
    sed -i 's/!\/opt\/miniconda3\/envs\/jeg_base\/bin\/python/!\/usr\/bin\/env python/g' $1
done
cd ..

tar czf  x86_glibc2_17.tar.gz  jeg_base

mv x86_glibc2_17.tar.gz /
