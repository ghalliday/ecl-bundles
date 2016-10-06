//class=disk
//class=quick
//class=diskread

//xversion checkCrc=true,hintHeapFlags=0x80,timeActivities=false
//xversion checkCrc=false,hintHeapFlags=0x80,timeActivities=false
//xversion checkCrc=true,hintHeapFlags=0x00,timeActivities=false
//xversion checkCrc=false,hintHeapFlags=0x00,timeActivities=false

//version checkCrc=false,hintHeapFlags=0x00,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x44,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x84,timeActivities=false
//version checkCrc=false,hintHeapFlags=0xC4,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x184,timeActivities=false
//version checkCrc=false,hintHeapFlags=0x1C4,timeActivities=false

#option ('optimizeLevel',3)

import ^ as root;
import $ as suite;
import suite.perform.config, suite.perform.files;

checkCrc := #IFDEFINED(root.checkCrc, false);
timeActivities := #IFDEFINED(root.timeActivities, false);

#option('crcReadEnabled', checkCrc);
#option('timeActivities', timeActivities);

ds := files.diskSimple(false);

OUTPUT(COUNT(NOFOLD(ds)) = config.simpleRecordCount);
