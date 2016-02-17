-module('txt').
-author('mats cronqvist').
-export([string/1]).

string(Str) ->
  case txt_scanner:string(Str) of
    {ok, Scan, _Line} ->
      case txt_parser:parse(Scan) of
        {ok, Exp} ->
          Exp;
        {error,Err} ->
          error({parse_error,Err})
      end;
    {error,Err,_Line} ->
      error({scan_error,Err})
  end.
