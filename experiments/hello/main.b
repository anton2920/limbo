implement Main;

include "sys.m";
	sys: Sys;
include "draw.m";

Main: module {
	init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string) {
	sys = load Sys Sys->PATH;

	sys->print("Hello, world!\n");
}
