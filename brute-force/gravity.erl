-module(gravity).
-export([gravity/2]).

% calculate resulting force vector between two bodies
gravity({A_mass, A_position}, {B_mass, B_position}) -> 
	% F = G(m1 * m2) / d^2
	% G = 6.67384 x 10^-11 m^3 kg^-1 s^-2
	%io:format("~p, ~p~n", [A_mass, B_mass]),
	%io:format("~p, ~p~n", [A_position, B_position]),

	% calculate all oriented distances (Pb - Pa) * abs(Pb - Pa)
	% map force function to distance list
	% return gravity vector

	[ 1, 1 ]
.