-module(gravity).
-export([gravity/2]).

% calculate resulting force vector between two bodies
gravity({A_mass, A_position}, {B_mass, B_position}) -> 
	% F = G(m1 * m2) / d^2
	%io:format("~p, ~p~n", [A_mass, B_mass]),
	%io:format("~p, ~p~n", [A_position, B_position]),
	[ 0, 0 ]
.