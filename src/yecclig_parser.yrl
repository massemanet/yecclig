Nonterminals
  pointer type_qualifier_list type_qualifier
  declaration init_declarator init_declarator_list declarator
  direct_declarator parameter_type_list parameter_list parameter_declaration
  identifier_list declaration_specifiers storage_class_specifier.

Terminals
  '(' ')' ',' ';' '*'
  'IDENTIFIER' 'ELLIPSIS' 'TYPEDEF'
  'CONST' 'RESTRICT' 'VOLATILE' 'ATOMIC'.

Rootsymbol
  declaration.

declaration ->
  declaration_specifiers init_declarator_list ';' : {decl,'$1','$2'}.

init_declarator_list ->
  init_declarator                      : '$1'.

init_declarator ->
  declarator                           : '$1'.

declarator ->
  pointer direct_declarator.
declarator ->
  direct_declarator.

direct_declarator ->
  'IDENTIFIER'                         : '$1'.
direct_declarator ->
  '(' declarator ')'.
direct_declarator ->
  direct_declarator '(' parameter_type_list ')'.
direct_declarator ->
  direct_declarator '(' ')'.
direct_declarator ->
  direct_declarator '(' identifier_list ')'.

parameter_type_list ->
  parameter_list ',' 'ELLIPSIS'.
parameter_type_list ->
  parameter_list.

parameter_list ->
  parameter_declaration.
parameter_list ->
  parameter_list ',' parameter_declaration.

parameter_declaration ->
  declaration_specifiers declarator.
parameter_declaration ->
  declaration_specifiers.

identifier_list ->
  'IDENTIFIER'                      : '$1'.
identifier_list ->
  identifier_list 'IDENTIFIER'      : ['$2'] ++ '$1'.


declaration_specifiers ->
  storage_class_specifier declaration_specifiers  : ['$1'] ++ '$2'.

declaration_specifiers ->
  storage_class_specifier                         : ['$1'].

storage_class_specifier ->
 'TYPEDEF'                                        : '$1'.

pointer ->
  '*' type_qualifier_list pointer.
pointer ->
  '*' type_qualifier_list.
pointer ->
  '*' pointer.
pointer ->
  '*'.


type_qualifier_list ->
  type_qualifier.
type_qualifier_list ->
  type_qualifier_list type_qualifier.

type_qualifier ->
  'CONST'.
type_qualifier ->
  'RESTRICT'.
type_qualifier ->
  'VOLATILE'.
type_qualifier ->
  'ATOMIC'.

Erlang code.
