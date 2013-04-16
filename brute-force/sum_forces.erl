-module(sum_forces).
-export([sum_forces/1]).

% sum two force vectors dimension by dimension
sum_forces([]) -> []; % empty vector
sum_forces([X]) -> X; % single force
sum_forces([X, Y]) -> lists:zipwith(fun(A, B) -> A + B end, X, Y); % base case
sum_forces([X, Y | Forces]) -> % recursion
	
	% sum first two along with the rest
	sum_forces( lists:append([ sum_forces([X, Y]) ], Forces) )

.