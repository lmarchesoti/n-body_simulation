-module(body).
-import(gravity).
-export([body/4]).

body(K, W, X, Y) -> 
	io:format("Body: ~p, Weight: ~p, X: ~p, Y: ~p~n", [K, W, X, Y]),

.