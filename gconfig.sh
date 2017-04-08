#! /usr/bin/bash
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 60
wait
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
wait
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5   40
wait

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50
wait
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 60
wait
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 40
wait

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 50
wait
sudo update-alternatives --set cc /usr/bin/gcc
wait
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 60
wait
sudo update-alternatives --set c++ /usr/bin/g++
wait
