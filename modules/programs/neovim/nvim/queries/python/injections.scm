;all_sql

  (string 
    (string_content) @injection.content
      (#vim-match? @injection.content "^\w*SELECT|FROM|INNER JOIN|WHERE|CREATE|DROP|INSERT|UPDATE|ALTER.*$")
      (#set! injection.language "sql"))

;css_variables
        (assignment
            ((identifier) @_varx (#match? @_varx ".*css$"))
            (string
                (string_content) @injection.content (#set! injection.language "css"))) 
      
;html_variables
        (assignment
            ((identifier) @_varx (#match? @_varx ".*[hH][tT][mM][lL]$"))
            (string
                (string_content) @injection.content (#set! injection.language "html"))) 
      
;javascript_variables
        (assignment
            ((identifier) @_varx (#match? @_varx ".*js$"))
            (string
                (string_content) @injection.content (#set! injection.language "javascript"))) 
      
;loads_attribute_json
        (call
          function: (attribute
              attribute: (identifier) @_idd (#eq? @_idd "loads"))
          arguments: (argument_list
            (string (string_content) @injection.content (#set! injection.language "json") ) ) )
      
;r_in_tagged_strings
		(string
			(string_content) @injection.content
			  (#vim-match? @injection.content "#R")
			  (#set! injection.language "r")
		)
	
;rst_for_docstring
      (function_definition
        (block
          (expression_statement
            (string
                (string_content) @injection.content (#set! injection.language "rst")))))
      
;sql_in_call
(call
  function: (attribute attribute: (identifier) @id (#match? @id "execute|read_sql"))
  arguments: (argument_list
     (string (string_content) @injection.content (#set! injection.language "sql"))))
     
;style_attribute_css
        (call
          function: (attribute
              attribute: (identifier) @_idd (#eq? @_idd "style"))
          arguments: (argument_list
            (string (string_content) @injection.content (#set! injection.language "css")))) 
      
;vue_for_add_slot
(call
  function: (attribute attribute: (identifier) @id (#match? @id "add_slot"))
  arguments: (argument_list
     (string (string_content) @injection.content (#set! injection.language "vue"))))
      
;printf
((binary_operator
left: (string
(string_content) @injection.content)
operator: "%")
(#set! injection.language "printf"))

;comment
((comment) @injection.content
(#set! injection.language "comment"))

