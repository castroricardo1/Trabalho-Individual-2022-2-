rm -rf build/docs

doxygen doxygen.conf

sphinx-build -b html docs/source build/docs

mkdir -p /docs
cp -r build/docs /docs

