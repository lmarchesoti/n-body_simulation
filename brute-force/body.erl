-module(body).
-import(gravity).
-export([body/3]).

% receive peer list and start simulation
body(Ticks, Mass, Position) -> 
	receive {bodies, L} -> Bodies = lists:delete(self(), L) end, 	% receive body pids list without self
	tick(Ticks, Bodies, Mass, Position) % run simulation for the number of ticks
.

% run simulation timesteps for each body
tick(0, _, _, _) -> ok;
tick(Tick, Bodies, Mass, Position) ->

	[ Body ! {Mass, Position} || Body <- Bodies ], % send position to every other body

	Forces = lists:map(fun(_) -> % for each body
		receive {A, B} -> Peer_mass = A, Peer_position = B end, % receive position and
		gravity:gravity({Mass, Position}, {Peer_mass, Peer_position}) % calculate force
		end, Bodies),

	% !! FORCES BETWEEN BODY1 AND BODY2 ARE ACTUALLY THE SAME.. MAYBE OPTIMIZE THIS OUT %

	% sum resultant forces
	io:format("Forces: ~p~n", [Forces]),

	% move

	% send new position to mother process
	io:format("Round: ~p, Mass: ~p, Position: ~p~n", [Tick, Mass, Position]),

	% next tick
	tick(Tick - 1, Bodies, Mass, Position)
.