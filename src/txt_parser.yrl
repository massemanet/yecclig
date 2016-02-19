Nonterminals
adjectives sentence sentences.

Terminals
article noun adjective
'.' ',' 'is' 'and' .

Rootsymbol sentences.

sentences -> sentence sentences : ['$1'|'$2'].
sentences -> sentence           : ['$1'].

sentence -> article noun '.'                 : {sentence,{'$1',[],'$2'}}.
sentence -> article noun 'is' adjectives '.' : {sentence,{'$1','$4','$2'}}.
sentence -> adjectives noun '.'              : {sentence,{[],'$1','$2'}}.
sentence -> article adjectives noun '.'      : {sentence,{'$1','$2','$3'}}.

adjectives -> adjective 'and' adjectives : ['$1'|'$3'].
adjectives -> adjective ',' adjectives   : ['$1'|'$3'].
adjectives -> adjective                  : ['$1'].
