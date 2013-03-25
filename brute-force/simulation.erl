-module(simulation).
-import(body).
-compile(export_all).

simulation(N, W, X, Y) ->
	Bodies = lists:map(fun(K) -> spawn(body, body, [K, random:uniform(W), random:uniform(X), random:uniform(Y)]) end,
		lists:seq(1, N)),
	Bodies ! tick
.