Nonterminals
adjectives sentence sentences.

Terminals
article noun adjective
'.' .

Rootsymbol sentences.

sentences -> sentence sentences : ['$1'|'$2'].
sentences -> sentence           : ['$1'].

sentence -> article noun '.'            : {sentence,{'$1',[],'$2'}}.
sentence -> adjectives noun '.'         : {sentence,{[],'$1','$2'}}.
sentence -> article adjectives noun '.' : {sentence,{'$1','$2','$3'}}.

adjectives -> adjective adjectives : ['$1'|'$2'].
adjectives -> adjective            : ['$1'].
