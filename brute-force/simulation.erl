-module(simulation).
-import(body).
-compile(export_all).

% run simulation
simulation(Body_count, Ticks, Max_mass, Max_dimension_size) ->
	% create random bodies
	Bodies = lists:map(fun(_) -> spawn(body, body, [Ticks, random:uniform(Max_mass), [random:uniform(Max_dimension_size), random:uniform(Max_dimension_size)]]) end,
		lists:seq(1, Body_count)),
	[ Body ! {bodies, Bodies} || Body <- Bodies ], % send pid list to every body
	% until simulation is over
		% receive each body's position and store them for animating
	ok
.