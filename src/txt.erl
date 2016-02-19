-module('txt').
-author('mats cronqvist').
-export([scan/1,parse/1,test/0]).

scan(Str) ->
  case txt_scanner:string(Str) of
    {ok, Tokens, _Line} ->
      Tokens;
    {error,Err,_Line} ->
      error({scan_error,Err})
  end.

parse(Str) ->
  case txt_parser:parse(scan(Str)) of
    {ok, Exp} ->
      Exp;
    {error,Err} ->
      error({parse_error,Err})
  end.

test() ->
  parse("an orange, salty tear. a red table. the chair."
        "the chair is red, orange and salty.").
