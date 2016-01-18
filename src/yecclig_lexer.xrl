Definitions.

L   = [a-zA-Z_]
A   = [a-zA-Z_0-9]
WS  = [\s\t\r\n\v]

Rules.

typedef    : {token, "TYPEDEF"}.

{L}{A}*    : {token, {"identifier",TokenChars}}.

,          : {token, ","}.
;          : {token, ";"}.
\(         : {token, "("}.
\)         : {token, ")"}.

#.*\n      : skip_token.               % line info from preproc
{WS}+      : skip_token.               % whitespace separates tokens
.          : {token,{bad,TokenChars}}. % discard bad characters

Erlang code.
