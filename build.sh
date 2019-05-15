set -e

work_root=`dirname $0`
work_root=`cd ${work_root}; pwd`

requirements=${work_root}/requirements.txt

# Step 1 compile python
# 1.1 python source code
cd ${work_root}
if [ ! -f Python-2.7.13.tgz ]; then
    wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
fi

# 1.2 configure && make && make install
if [ ! -d ${work_root}/Python-2.7.13 ]; then
    cd ${work_root}
    tar xf ${work_root}/Python-2.7.13.tgz
fi
if [ -d ${work_root}/python-2.7-ucs4 ]; then
    rm -rf ${work_root}/python-2.7-ucs4
fi

cd ${work_root}/Python-2.7.13
./configure --prefix=${work_root}/python-2.7-ucs4 --enable-unicode=ucs4
sed -i 's/#.*zlib zlibmodule.c/zlib zlibmodule.c/g' Modules/Setup
make -j20
make install

# 1.3 install pip
cd ${work_root}
if [ ! -f get-pip.py ]; then
    curl -s https://bootstrap.pypa.io/get-pip.py -o ${work_root}/get-pip.py
fi
${work_root}/python-2.7-ucs4/bin/python ${work_root}/get-pip.py

# 1.4 install requirements
${work_root}/python-2.7-ucs4/bin/pip install -r ${requirements}

# 1.5 make python zip
if [ -f ${work_root}/python-2.7-ucs4.zip ]; then
    rm -rf ${work_root}/python-2.7-ucs4.zip
fi
cd ${work_root}
zip -r ${work_root}/python-2.7-ucs4.zip python-2.7-ucs4
