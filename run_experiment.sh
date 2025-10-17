pushd ./simple-comunica-runner
    ./install.sh
popd

pushd ./simple-solidbench-comunica-runner
    yarn node index.mjs -q ../queries -c ../config.json -r 50 -e ../simple-comunica-runner/index.mjs -o ../results &> ../results/log
popd
