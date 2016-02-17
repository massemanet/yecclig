Definitions.
WS = [^a-zA-Z\.]+

Rules.
\.       : {token,{'.',TokenLine}}.
red      : {token,{adjective,TokenLine,TokenChars}}.
orange   : {token,{adjective,TokenLine,TokenChars}}.
salty    : {token,{adjective,TokenLine,TokenChars}}.
table    : {token,{noun,TokenLine,TokenChars}}.
chair    : {token,{noun,TokenLine,TokenChars}}.
a        : {token,{article,TokenLine,TokenChars}}.
an       : {token,{article,TokenLine,TokenChars}}.
the      : {token,{article,TokenLine,TokenChars}}.
({WS})   : skip_token.

Erlang code.

