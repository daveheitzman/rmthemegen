[styling]
default=0xfc7edb;0x1a1a1a;false;false
commentline=0x417d1c;0x1a1a1a;false;false
number=0xd414a8;0x1a1a1a;false;false
string=0x5a36ef;0x1a1a1a;false;false
character=0x7fadc1;0x1a1a1a;false;false
word=0xbf6bf4;0x1a1a1a;false;false
global=0xaa7363;0x1a1a1a;false;false
symbol=0x87cc25;0x1a1a1a;false;false
classname=0xa6bffc;0x1a1a1a;false;false
defname=0xf606aa;0x1a1a1a;false;false
operator=0x97e637;0x1a1a1a;false;false
identifier=0xb54f83;0x1a1a1a;false;false
modulename=0xa324bd;0x1a1a1a;false;false
backticks=0xe695c1;0x1a1a1a;false;false
instancevar=0x988f42;0x1a1a1a;false;false
classvar=0xff6fb6;0x1a1a1a;false;false
heredelim=0x29a4cc;0x1a1a1a;false;false
worddemoted=0x5ff518;0x1a1a1a;false;false
stdin=0x4ead50;0x1a1a1a;false;false
stdout=0xf62ab5;0x1a1a1a;false;false
stderr=0xb653a0;0x1a1a1a;false;false
datasection=0x50ddcf;0x1a1a1a;false;false
regex=0x1bc3f3;0x1a1a1a;false;false
here_q=0x5eb7cd;0x1a1a1a;false;false
here_qq=0xde35ca;0x1a1a1a;false;false
here_qx=0xb07bc2;0x1a1a1a;false;false
string_q=0xe98590;0x1a1a1a;false;false
string_qq=0x22b6c3;0x1a1a1a;false;false
string_qx=0x0ea497;0x1a1a1a;false;false
string_qr=0x3dae90;0x1a1a1a;false;false
string_qw=0x4b99f4;0x1a1a1a;false;false
upper_bound=0x77c349;0x1a1a1a;false;false
error=0xb7905c;0x1a1a1a;false;false
pod=0x72b103;0x1a1a1a;false;false
      
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
