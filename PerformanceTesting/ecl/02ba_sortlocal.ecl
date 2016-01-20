//class=memory
//class=sort
//version algo='quicksort'
//version algo='parquicksort'
//version algo='quicksort',spill=true,nothor,nohthor
//version algo='parquicksort',spill=true,nothor,nohthor
//version algo='quicksort',stable=false
//version algo='parquicksort',stable=false
//version algo='quicksort',stable=false,spill=true,nothor,nohthor
//version algo='parquicksort',stable=false,spill=true,nothor,nohthor
//version algo='mergesort'
//version algo='parmergesort'
//version algo='parmergesort',spill=true,nothor,nohthor
//version algo='heapsort'
//version algo='tbbstableqsort',nohthor

import ^ as root;
algo := #IFDEFINED(root.algo, 'parmergesort');
isStable := #IFDEFINED(root.stable, true);
canSpill := #IFDEFINED(root.spill, false);

import $ as suite;
import suite.perform.config;
import suite.perform.format;
import suite.perform.files;

ds := files.generateSimple();

s1 := IF(isStable,
            sort(ds, id3, local, stable(algo), hint(spill(canSpill))),
            sort(ds, id3, local, unstable(algo), hint(spill(canSpill)))
      );

output(COUNT(NOFOLD(s1)) = config.simpleRecordCount);
