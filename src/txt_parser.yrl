Nonterminals
adjectives sentence.

Terminals
article noun adjective.

Rootsymbol sentence.

sentence -> article noun            : {'$1',[],'$2'}.
sentence -> adjectives noun         : {[],'$1','$2'}.
sentence -> article adjectives noun : {'$1','$2','$3'}.

adjectives -> adjective adjectives : ['$1'|'$2'].
adjectives -> adjective            : ['$1'].
