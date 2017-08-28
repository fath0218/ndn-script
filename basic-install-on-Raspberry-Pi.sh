#highly recommend using Pi 2 or later version to use these script.
#for device like Pi 1, please add "-j1" after "./waf", or try cross-compilation.

sudo apt-get install -y build-essential libcrypto++-dev libsqlite3-dev libboost-all-dev libssl-dev
git clone https://github.com/named-data/ndn-cxx
cd ndn-cxx
git pull origin
./waf configure --with-examples --boost-lib /usr/lib/arm-linux-gnueabihf/
./waf
sudo ./waf install
sudo ldconfig

cd ..

git clone --recursive https://github.com/named-data/NFD
cd NFD
git pull origin
./waf configure --without-websocket --without-libpcap --boost-lib /usr/lib/arm-linux-gnueabihf/
./waf
sudo ./waf install
sudo ldconfig

sudo cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf
