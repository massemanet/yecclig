%% -*- mode: erlang; erlang-indent-level: 2 -*-
%%% Created : 18 Jan 2016 by mats cronqvist <masse@klarna.com>

%% @doc
%% @end

-module('yecclig').
-author('mats cronqvist').
-export([file/1]).

file(Filename) ->
  {ok,FD} = file:open(Filename,[read,raw,read_ahead]),
  try parse(scan(FD,yecclig_lexer))
  after file:close(FD)
  end.

parse(Toks) -> Toks.

scan(FD,Scanner) -> scan(FD,read(FD),Scanner,1,[]).

scan(_,eof,_,_,Acc) -> lists:reverse(Acc);
scan(FD,Bytes,Scanner,Line,Acc) ->
  case Scanner:string(Bytes,Line) of
    {ok,Tokens,NewLine} ->
      scan(FD,read(FD),Scanner,NewLine,lists:reverse(Tokens)++Acc);
    Err ->
      error(Err)
  end.

read(FD) ->
  case file:read_line(FD) of
    {ok,Bytes} -> Bytes;
    eof        -> eof;
    {error,R}  -> error(R)
  end.
