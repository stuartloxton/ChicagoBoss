-module (boss_log).
-export ([log/1]).

log(Req) ->
	{Year, Month, Day} = erlang:date(),
	{Hour, Minute, Second} = erlang:time(),
	Line = io_lib:format("Request ~s ~s [~p/~p/~p ~2..0B:~2..0B:~2..0B]~n", 
			[Req:get(method), Req:get(raw_path), Day, Month, Year, Hour, Minute, Second]),
	file:write_file("log/http.log", Line, [append]).