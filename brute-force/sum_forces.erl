-module(sum_forces).
-export([sum_forces/1]).

sum_forces([]) -> [];
sum_forces([X]) -> X;
sum_forces([X, Y]) -> lists:zipwith(fun(A, B) -> A + B end, X, Y);
sum_forces([X, Y | Forces]) ->

	%io:format("Elements: ~p, ~p, ~p~n", [X, Y, Forces]),
	
	sum_forces(
		[ sum_forces([X, Y]),
			lists:flatten(Forces) ])
		%sum_forces(Forces) ])
		% concatenate lists instead of flattening

.