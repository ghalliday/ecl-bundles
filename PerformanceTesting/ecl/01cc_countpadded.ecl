//class=disk
//class=quick
//class=diskread

//version checkCrc=false,hintHeapFlags=0x00,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x44,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x80,timeActivities=false
//version checkCrc=false,hintHeapFlags=0xC0,timeActivities=false

#option ('optimizeLevel',3)

import ^ as root;
import $ as suite;
import suite.perform.config, suite.perform.files;

checkCrc := #IFDEFINED(root.checkCrc, false);
timeActivities := #IFDEFINED(root.timeActivities, false);

#option('crcReadEnabled', checkCrc);
#option('timeActivities', timeActivities);

ds := files.diskPadded(false);

OUTPUT(COUNT(NOFOLD(ds)) = config.simpleRecordCount);
