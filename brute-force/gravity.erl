-module(gravity).
-export([gravity/2]).

% calculate resulting force vector between two bodies
gravity({A_mass, A_position}, {B_mass, B_position}) -> 
	
	% F = G(m1 * m2) / d^2

	% Gravitational constant = 6.67384 * 10^-11 m^3 kg^-1 s^-2
	G_constant = 6.67384e-11,

	% calculate all oriented square distances (Pb - Pa) * abs(Pb - Pa)
	Distance = lists:zipwith(fun(X, Y) -> Y - X end, A_position, B_position),
	Dist_sq = lists:map(fun(X) -> X * abs(X) end, Distance),
	
	Gravitation = G_constant * A_mass * B_mass, % G * m1 * m2

	% map force function to distance list
	lists:map(fun(X) -> Gravitation / X end, Dist_sq)

.