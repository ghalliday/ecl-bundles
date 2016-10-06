//class=memory
//class=quick
//class=create

//version hintHeapFlags=0x05,numToKeep=1
//version hintHeapFlags=0x05,numToKeep=10
//version hintHeapFlags=0x05,numToKeep=5000
//version hintHeapFlags=0x05,numToKeep=10000
//version hintHeapFlags=0x85,numToKeep=13050
//version hintHeapFlags=0x85,numToKeep=1
//version hintHeapFlags=0x85,numToKeep=10
//version hintHeapFlags=0x85,numToKeep=5000
//version hintHeapFlags=0x85,numToKeep=6550
//version hintHeapFlags=0x85,numToKeep=10000
//version hintHeapFlags=0x85,numToKeep=12000
//version hintHeapFlags=0x85,numToKeep=12500
//version hintHeapFlags=0x85,numToKeep=12900
//version hintHeapFlags=0x85,numToKeep=13000
//version hintHeapFlags=0x85,numToKeep=13050
//version hintHeapFlags=0x85,numToKeep=13095
//version hintHeapFlags=0x85,numToKeep=13099
//version hintHeapFlags=0x85,numToKeep=13101

import ^ as root;
import $ as suite;
import suite.perform.config, suite.perform.files;

numToKeep := #IFDEFINED(root.numToKeep, 13060);
heapFlags := #IFDEFINED(root.hintHeapFlags, 0x85);

#option ('heapFlags', heapFlags);

import $ as suite;
import suite.perform.config;
import suite.perform.files;

ds := files.generateSimpleLocal();

filtered := NOCOMBINE(ds)(id1 <= numToKeep);

s := SORT(NOCOMBINE(filtered), id2, LOCAL);
cnt := NOFOLD(count(NOCOMBINE(s)));

OUTPUT(cnt = numToKeep * CLUSTERSIZE);
