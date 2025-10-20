# Online Schema Alignment with LTQP Experiments With queries With Different Vocabularies

Experiments to benchmark solidbench queries using in a network using different vocabularies.
The schema vocabularies and the schema alignment rules are defined `./server/vocab.json`.
The queries are available in the `./queries` directory.

## Dependencies
 - [Nodejs version 22](https://nodejs.org/en)

Has only been tested on Linux

## Installation

Make sure that all the submodules [are correctly installed](https://git-scm.com/book/en/v2/Git-Tools-Submodules) 

## Running the experiment

First, the solidbench dataset must be generated and served locally.
```sh
pushd ./server
    ./install.sh
    yarn run solidbench-generate
    yarn run solidbench-serve
popd
```

Second, the experiment must be run through the benchmark runner.
To do so, first install comunica

```sh
pushd ./simple-comunica-runner
    ./install.sh
popd
```

second run, the benchmark runner

```sh
pushd ./simple-solidbench-comunica-runner
    yarn install
    yarn node index.mjs -q ../queries -c ../config.json -r 50 -e ../simple-comunica-runner/index.mjs -o ../results -n "standard-shape-index-experiment" &> ../results/log
popd
```

you can save each iteration of the benchmark to a nextcloud cloud storage using the `-b` parameter with the URL
of a cloud storage with a write permission.
The results will be materialized in the `./results` directory.

## Modification

interactive-discover-1: vocabulary version 2
interactive-discover-2: https
interactive-discover-3: hasTag changed to hasHashTag
interactive-discover-4: vocabulary version 2 foaf:name changed for https://www.w3.org/ns/person#patronymicName
interactive-discover-5: vocabulary version 3
interactive-discover-6: hasCreator changed for FromAuthor
interactive-discover-7: svnco changed for http://localhost:3000/www.example.com/vocabulary/
interactive-discover-8: hasComment replace by hasReply

interactive-short-1: vocabulary version 2
interactive-short-2: imageFile replace to imageLocation
interactive-short-3: lastName replace to familyName, creationDate creationTime
interactive-short-4: vocabulary version 2
interactive-short-5: id for identification, lastName replace to familyName
interactive-short-6: title for forumTitle
interactive-short-7: content changed for text
