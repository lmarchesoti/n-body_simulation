-module(gravity).
-export([gravity/2]).

gravity({MassA, PositionA}, {MassB, PositionB}) -> 
	io:format("~p, ~p~n", [MassA, MassB]),
	io:format("~p, ~p~n", [PositionA, PositionB]),
	{Force, Direction}
.