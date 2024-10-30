implement Main;

include "sys.m";
	sys: Sys;
include "draw.m";
include "rand.m";
	rand: Rand;

Main: module {
	init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string) {
	sys = load Sys Sys->PATH;
	rand = load Rand Rand->PATH;

	labs := array[] of {
		array[] of {10, 10, 10},
		array[] of {27, 27, 0},
		array[] of {27, 27, 8},
		array[] of {10, 17, 27},
		array[] of {8, 6, 26},
		array[] of {10, 25, 27},
	};

	ntickets: con 30;
	ntasks: con 3;

	for (i := 0; i < ntickets; i++) {
		sys->print("Ticket %d:\n", i+1);
		for (j := 0; j < ntasks; j++) {
			lab: int;
			task: int;
			do {
				lab = rand->rand(len labs);
				task = rand->rand(3);
			} while(labs[lab][task] == 0);
			problem := rand->rand(labs[lab][task]);
			sys->print("\t(Lab: %d, Task: %d, Problem: %d)\n", lab+1, task+1, problem+1);
		}
		sys->print("\n");
	}
}
