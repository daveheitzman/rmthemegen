[styling]
default=0x07e2eb;0x111111;false;false
commentline=0x0d773b;0x111111;false;false
number=0x4787c0;0x111111;false;false
string=0x6efbe1;0x111111;false;false
character=0x5179ed;0x111111;false;false
word=0x18d3ae;0x111111;false;false
global=0xda4860;0x111111;false;false
symbol=0x4fe789;0x111111;false;false
classname=0x16b265;0x111111;false;false
defname=0x942ffa;0x111111;false;false
operator=0x2ce611;0x111111;false;false
identifier=0x95bbca;0x111111;false;false
modulename=0x7cfdf6;0x111111;false;false
backticks=0x34b6e5;0x111111;false;false
instancevar=0xeba504;0x111111;false;false
classvar=0xf39eac;0x111111;false;false
heredelim=0x7e8ee4;0x111111;false;false
worddemoted=0x911fb9;0x111111;false;false
stdin=0x65acef;0x111111;false;false
stdout=0xd65b58;0x111111;false;false
stderr=0xa1eb30;0x111111;false;false
datasection=0x2ef9b4;0x111111;false;false
regex=0xb39ab3;0x111111;false;false
here_q=0x5ba041;0x111111;false;false
here_qq=0xe9bd00;0x111111;false;false
here_qx=0x36ce72;0x111111;false;false
string_q=0x2180c7;0x111111;false;false
string_qq=0xe0ebc3;0x111111;false;false
string_qx=0xd16b72;0x111111;false;false
string_qr=0xd1ca58;0x111111;false;false
string_qw=0xf6afbe;0x111111;false;false
upper_bound=0x8fdab5;0x111111;false;false
error=0x1ed78b;0x111111;false;false
pod=0x6ce485;0x111111;false;false
      
# for embedded Python script (<script language="python">...</script>), Python styles from
# filetypes.python are used

[keywords]
html=a abbr acronym address applet area b base basefont bdo big blockquote body br button caption center cite code col colgroup dd del dfn dir div dl dt em embed fieldset font form frame frameset h1 h2 h3 h4 h5 h6 head hr html i iframe img input ins isindex kbd label legend li link map menu meta noframes noscript object ol optgroup option p param pre q quality s samp script select small span strike strong style sub sup table tbody td textarea tfoot th thead title tr tt u ul var xmlns leftmargin topmargin abbr accept-charset accept accesskey action align alink alt archive axis background bgcolor border cellpadding cellspacing char charoff charset checked cite class classid clear codebase codetype color cols colspan compact content coords data datafld dataformatas datapagesize datasrc datetime declare defer dir disabled enctype face for frame frameborder selected headers height href hreflang hspace http-equiv id ismap label lang language link longdesc marginwidth marginheight maxlength media framespacing method multiple name nohref noresize noshade nowrap object onblur onchange onclick ondblclick onfocus onkeydown onkeypress onkeyup onload onmousedown onmousemove onmouseover onmouseout onmouseup onreset onselect onsubmit onunload profile prompt pluginspage readonly rel rev rows rowspan rules scheme scope scrolling shape size span src standby start style summary tabindex target text title type usemap valign value valuetype version vlink vspace width text password checkbox radio submit reset file hidden image public doctype xml xml:lang
javascript=abs abstract acos anchor asin atan atan2 big bold boolean break byte case catch ceil char charAt charCodeAt class concat const continue cos Date debugger default delete do double else enum escape eval exp export extends false final finally fixed float floor fontcolor fontsize for fromCharCode function goto if implements import in indexOf Infinity instanceof int interface isFinite isNaN italics join lastIndexOf length link log long Math max MAX_VALUE min MIN_VALUE NaN native NEGATIVE_INFINITY new null Number package parseFloat parseInt pop POSITIVE_INFINITY pow private protected public push random return reverse round shift short sin slice small sort splice split sqrt static strike string String sub substr substring sup super switch synchronized tan this throw throws toLowerCase toString toUpperCase transient true try typeof undefined unescape unshift valueOf var void volatile while with
vbscript=and as byref byval case call const continue dim do each else elseif end error exit false for function global goto if in loop me new next not nothing on optional or private public redim rem resume select set sub then to true type while with boolean byte currency date double integer long object single string type variant
python=and assert break class continue complex def del elif else except exec finally for from global if import in inherit is int lambda not or pass print raise return tuple try unicode while yield long float str list
php=abstract and array as bool boolean break case catch cfunction __class__ class clone const continue declare default die __dir__ directory do double echo else elseif empty enddeclare endfor endforeach endif endswitch endwhile eval exception exit extends false __file__ final float for foreach __function__ function goto global if implements include include_once int integer interface isset __line__ list __method__ namespace __namespace__ new null object old_function or parent php_user_filter print private protected public real require require_once resource return __sleep static stdclass string switch this throw true try unset use var __wakeup while xor
sgml=ELEMENT DOCTYPE ATTLIST ENTITY NOTATION


[settings]
# default extension used when saving files
#extension=xml

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=<!--
comment_close=-->

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[styling]
# foreground;background;bold;italic
