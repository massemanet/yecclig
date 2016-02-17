-module('txt').
-author('mats cronqvist').
-export([string/1]).

string(Str) ->
  {ok, Scan, _Line} = txt_scanner:string(Str),
  {ok, Exp} = txt_parser:parse(Scan),
  Exp.
