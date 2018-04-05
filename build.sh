echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
if [ ! -d build ]; then
    mkdir build
fi
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

if [ ! -d build ]; then
    mkdir build
fi
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../../

echo "Configuring and building ORB_SLAM2 ..."

if [ ! -d build ]; then
    mkdir build
fi
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ..

if [ ! -f Vocabulary/ORBvoc.txt ]; then
    echo "Uncompressing vocabulary ..."

    cd Vocabulary
    tar -xf ORBvoc.txt.tar.gz
    cd ..
fi

if [ ! -f Vocabulary/ORBvoc.bin ]; then
    echo "Converting vocabulary to binary"
    ./tools/bin_vocabulary
fi
