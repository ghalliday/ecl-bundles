//class=memory
//class=join

import $ as suite;
import suite.perform.tests;

j := tests.selfjoin(4);
output(COUNT(NOFOLD(j.joinLocalNormal)) = j.numExpected);
