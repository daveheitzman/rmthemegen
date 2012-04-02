
module RMThemeGen
  class RMThemeParent
      @@doc_opt_keys = %w(  LINE_SPACING  EDITOR_FONT_SIZE  EDITOR_FONT_NAME)
      @@doc_color_keys = %w(ANNOTATIONS_COLOR CARET_COLOR CARET_ROW_COLOR CONSOLE_BACKGROUND_KEY GUTTER_BACKGROUND INDENT_GUIDE LINE_NUMBERS_COLOR
        METHOD_SEPARATORS_COLOR MODIFIED_LINES_COLOR READONLY_BACKGROUND READONLY_FRAGMENT_BACKGROUND RECURSIVE_CALL_ATTRIBUTES RIGHT_MARGIN_COLOR
        SELECTED_INDENT_GUIDE SELECTED_TEARLINE_COLOR SELECTION_BACKGROUND SELECTION_FOREGROUND TEARLINE_COLOR WHITESPACES)
      @@element_keys = %w( ABSTRACT_CLASS_NAME_ATTRIBUTES ANNOTATION_ATTRIBUTE_NAME_ATTRIBUTES ANNOTATION_NAME_ATTRIBUTES ATTR_INTERNAL_CALL_ID BAD_CHARACTER BREAKPOINT_ATTRIBUTES CLASS_NAME_ATTRIBUTES CONSOLE_BLUE_OUTPUT CONSOLE_CYAN_OUTPUT CONSOLE_ERROR_OUTPUT CONSOLE_GRAY_OUTPUT CONSOLE_GREEN_OUTPUT CONSOLE_MAGENTA_OUTPUT CONSOLE_NORMAL_OUTPUT CONSOLE_OUTPUT CONSOLE_RED_OUTPUT CONSOLE_SYSTEM_OUTPUT CONSOLE_USER_INPUT CONSOLE_YELLOW_OUTPUT CSS.COMMENT CSS.FUNCTION CSS.IDENT CSS.KEYWORD CSS.NUMBER CSS.PROPERTY_NAME CSS.PROPERTY_VALUE CSS.STRING CSS.TAG_NAME CSS.URL CUSTOM_INVALID_STRING_ESCAPE_ATTRIBUTES CUSTOM_KEYWORD1_ATTRIBUTES CUSTOM_KEYWORD2_ATTRIBUTES CUSTOM_KEYWORD3_ATTRIBUTES CUSTOM_KEYWORD4_ATTRIBUTES CUSTOM_LINE_COMMENT_ATTRIBUTES CUSTOM_MULTI_LINE_COMMENT_ATTRIBUTES CUSTOM_NUMBER_ATTRIBUTES CUSTOM_STRING_ATTRIBUTES CUSTOM_VALID_STRING_ESCAPE_ATTRIBUTES DEPRECATED_ATTRIBUTES DIFF_CONFLICT DIFF_DELETED DIFF_INSERTED DIFF_MODIFIED DUPLICATE_FROM_SERVER EL.BOUNDS EL.BRACKETS EL.IDENT EL.KEYWORD EL.NUMBER EL.PARENTHS EL.STRING EL_BACKGROUND ERRORS_ATTRIBUTES EXECUTIONPOINT_ATTRIBUTES FOLDED_TEXT_ATTRIBUTES FOLLOWED_HYPERLINK_ATTRIBUTES GENERIC_SERVER_ERROR_OR_WARNING GHERKIN_KEYWORD HAML_CLASS HAML_COMMENT HAML_FILTER HAML_FILTER_CONTENT HAML_ID HAML_LINE_CONTINUATION HAML_RUBY_CODE HAML_RUBY_START HAML_TAG HAML_TEXT HAML_XHTML HTML_ATTRIBUTE_NAME HTML_ATTRIBUTE_VALUE HTML_COMMENT HTML_ENTITY_REFERENCE HTML_TAG HTML_TAG_NAME HYPERLINK_ATTRIBUTES IDENTIFIER_UNDER_CARET_ATTRIBUTES INCLUDE_JAVA_CALL INFO_ATTRIBUTES INJECTED_LANGUAGE_FRAGMENT INSPECTION_MULTIPLE_RESOLVE_WARNING_ID INSTANCE_FIELD_ATTRIBUTES INTERFACE_NAME_ATTRIBUTES JAVA_DOC_COMMENT JAVA_DOC_MARKUP JAVA_INVALID_STRING_ESCAPE JAVA_KEYWORD JAVA_NUMBER JAVA_STRING JAVA_VALID_STRING_ESCAPE JS.ATTRIBUTE JS.BADCHARACTER JS.BLOCK_COMMENT JS.DOC_COMMENT JS.DOC_MARKUP JS.DOC_TAG JS.GLOBAL_FUNCTION JS.GLOBAL_VARIABLE JS.INSTANCE_MEMBER_FUNCTION JS.INSTANCE_MEMBER_VARIABLE JS.INVALID_STRING_ESCAPE JS.KEYWORD JS.LINE_COMMENT JS.LOCAL_VARIABLE JS.NUMBER JS.PARAMETER JS.REGEXP JS.STATIC_MEMBER_FUNCTION JS.STATIC_MEMBER_VARIABLE JS.STRING JS.VALID_STRING_ESCAPE JSP_ATTRIBUTE_NAME JSP_ATTRIBUTE_VALUE JSP_DIRECTIVE_BACKGROUND JSP_DIRECTIVE_NAME JSP_SCRIPTING_BACKGROUND LESS_VARIABLE MATCHED_BRACE_ATTRIBUTES NOT_USED_ELEMENT_ATTRIBUTES PROPERTIES.INVALID_STRING_ESCAPE PROPERTIES.KEY PROPERTIES.VALID_STRING_ESCAPE PROPERTIES.VALUE REGEXP.BRACES REGEXP.BRACKETS REGEXP.ESC_CHARACTER REGEXP.META REGEXP.PARENTHS REGEXP.CHAR_CLASS REGEXP.INVALID_STRING_ESCAPE REGEXP.QUOTE_CHARACTER REGEXP.REDUNDANT_ESCAPE REQUIRE_GEM_CALL RHTML_COMMENT_ID RHTML_EXPRESSION_END_ID RHTML_EXPRESSION_START_ID RHTML_OMIT_NEW_LINE_ID RHTML_SCRIPTING_BACKGROUND_ID RHTML_SCRIPTLET_END_ID RHTML_SCRIPTLET_START_ID 
     
      
      RUBY_ATTR_ACCESSOR_CALL RUBY_ATTR_READER_CALL RUBY_ATTR_WRITER_CALL RUBY_BACK_REF RUBY_BAD_CHARACTER RUBY_BRACKETS RUBY_COMMA RUBY_COMMENT RUBY_CONSTANT RUBY_CONSTANT_DEF_ID RUBY_CVAR RUBY_ESCAPE_SEQUENCE RUBY_EXPR_IN_STRING RUBY_GVAR RUBY_HASH_ASSOC RUBY_HEREDOC_CONTENT RUBY_HEREDOC_ID RUBY_IDENTIFIER RUBY_IMPORT_CALL RUBY_INVALID_ESCAPE_SEQUENCE RUBY_IVAR RUBY_KEYWORD RUBY_LINE_CONTINUATION RUBY_LOCAL_VAR_ID RUBY_METHOD_NAME RUBY_NTH_REF RUBY_NUMBER RUBY_OPERATION_SIGN RUBY_PARAMDEF_CALL RUBY_PARAMETER_ID RUBY_PRIVATE_CALL RUBY_PROTECTED_CALL RUBY_PUBLIC_CALL RUBY_REGEXP RUBY_REQUIRE_ARG_CALL RUBY_REQUIRE_CALL RUBY_SEMICOLON RUBY_SPECIFIC_CALL RUBY_STRING RUBY_SYMBOL RUBY_WORDS 
      
      SASS_ATTRIBUTE SASS_COMMENT SASS_CONSTANT SASS_DIRECTIVE SASS_MIXIN SASS_NUMBER SASS_RULE SASS_STRING SASS_VARIABLE SCOPE_KEY_All SCOPE_KEY_Non-Project Files SCOPE_KEY_Problems SCOPE_KEY_Production SCOPE_KEY_Project Files SCOPE_KEY_Tests SEARCH_RESULT_ATTRIBUTES SQL_KEYWORD STATIC_FIELD_ATTRIBUTES TEMPLATE_VARIABLE_ATTRIBUTES TEXT TEXT_SEARCH_RESULT_ATTRIBUTES TODO_DEFAULT_ATTRIBUTES TYPO WARNING_ATTRIBUTES WRITE_IDENTIFIER_UNDER_CARET_ATTRIBUTES WRITE_SEARCH_RESULT_ATTRIBUTES WRONG_REFERENCES_ATTRIBUTES XML_ATTRIBUTE_NAME XML_ATTRIBUTE_VALUE XML_COMMENT XML_ENTITY_REFERENCE XML_PROLOGUE XML_TAG XML_TAG_DATA XML_TAG_NAME YAML_COMMENT YAML_SCALAR_DSTRING YAML_SCALAR_KEY YAML_SCALAR_LIST YAML_SCALAR_STRING YAML_SCALAR_VALUE YAML_SCALAR_VALUE4 YAML_SIGN YAML_TEXT)

  	@@tokens_for_css = %w(
    CARET_ROW_COLOR
    RUBY_ATTR_ACCESSOR_CALL 
    RUBY_ATTR_READER_CALL 
    RUBY_ATTR_WRITER_CALL 
    RUBY_BACK_REF 
    RUBY_BAD_CHARACTER 
    RUBY_BRACKETS 
    RUBY_COMMA 
    RUBY_COMMENT 
    RUBY_CONSTANT 
    RUBY_CONSTANT_DEF_ID 
    RUBY_CVAR 
    RUBY_ESCAPE_SEQUENCE 
    RUBY_EXPR_IN_STRING 
    RUBY_GVAR 
    RUBY_HASH_ASSOC 
    RUBY_HEREDOC_CONTENT 
    RUBY_HEREDOC_ID 
    RUBY_IDENTIFIER 
    RUBY_IMPORT_CALL 
    RUBY_INVALID_ESCAPE_SEQUENCE 
    RUBY_IVAR 
    RUBY_KEYWORD 
    RUBY_LINE_CONTINUATION 
    RUBY_LOCAL_VAR_ID 
    RUBY_METHOD_NAME 
    RUBY_NTH_REF 
    RUBY_NUMBER 
    RUBY_OPERATION_SIGN 
    RUBY_PARAMDEF_CALL 
    RUBY_PARAMETER_ID 
    RUBY_PRIVATE_CALL 
    RUBY_PROTECTED_CALL 
    RUBY_PUBLIC_CALL 
    RUBY_REGEXP 
    RUBY_REQUIRE_ARG_CALL 
    RUBY_REQUIRE_CALL 
    RUBY_SEMICOLON 
    RUBY_SPECIFIC_CALL 
    RUBY_STRING 
    RUBY_SYMBOL 
    RUBY_WORDS 
    SELECTION_BACKGROUND
    
    )

    # the following is a map where :k = the symbol name in rubymine, and :v is an array containing the
    # human readable name and scope name in textmate.
    # to shorten things up, the string structure is an array::RUBY_ATTR_ACCESSOR_CALL=>["name","scope",:settings=>{}], 
    # the hash at the end is currently unused, but it could be used to hardwire values in 
    # if necessary, so it will be left in for now

#    :RUBY_BACK_REF =>["name","scope",{}],
#    :RUBY_LINE_CONTINUATION=>["name","scope",{}], 
#    :RUBY_NTH_REF =>["name","scope",{}],

    @@document_opts_to_textmate = {
    :RUBY_ATTR_ACCESSOR_CALL=>["keyword.other.special-method.ruby","keyword.other.special-method.ruby",{}], 
    :RUBY_ATTR_READER_CALL =>["keyword.other.special-method.ruby","keyword.other.special-method.ruby",{}],
    :RUBY_ATTR_WRITER_CALL =>["keyword.other.special-method.ruby","keyword.other.special-method.ruby",{}],
    :RUBY_BAD_CHARACTER=>["Invalid - Illegal","invalid.illegal",{}], 
    :RUBY_BRACKETS =>["Ruby Brackets","punctuation.section.function, meta.brace.curly.function, meta.function-call punctuation.section.scope.ruby",{}],
    :RUBY_COMMA =>["Comma","meta.delimiter.object.comma",{}],
    :RUBY_COMMENT =>["Comment","comment",{}],
    :RUBY_CONSTANT =>["Constant","constant.language.ruby",{}],
    :RUBY_CONSTANT_DEF_ID=>["Constant Def ID","constant.character",{}], 
    :RUBY_CVAR =>["Class Variable","variable.other.readwrite.class.ruby",{}],
    :RUBY_ESCAPE_SEQUENCE =>["String Escapes","string constant.character.escape",{}],
    :RUBY_EXPR_IN_STRING =>["String Interpolation","string.interpolated",{}],
    :RUBY_GVAR =>["Global Variable","variable.other.readwrite.global",{}],
    :RUBY_HASH_ASSOC =>["Hash Separator","punctuation.separator.key-value",{}],
    :RUBY_HEREDOC_CONTENT =>["Heredoc","meta.scope.heredoc",{}],
    :RUBY_HEREDOC_ID =>["Heredoc ID","meta.scope.heredoc",{}],
    :RUBY_IDENTIFIER =>["Identifier","constant.language",{}],
    :RUBY_IMPORT_CALL =>["Import","keyword.control.import",{}],
    :RUBY_INVALID_ESCAPE_SEQUENCE=>["Invalid","invalid.deprecated invalid.illegal",{}], 
    :RUBY_IVAR =>["Instance Variable","variable.other.readwrite.instance.ruby",{}],
    :RUBY_KEYWORD =>["Ruby Keyword","keyword.control.ruby meta.module.ruby",{}],
    :RUBY_LOCAL_VAR_ID =>["Local Variable","variable.other.local",{}],
    :RUBY_METHOD_NAME =>["Method","declaration.function, entity.name.function, support.function.any-method",{}],
    :RUBY_NUMBER =>["Number","constant.numeric",{}],
    :RUBY_OPERATION_SIGN=>["Ruby Operation Sign","keyword.operator.logical.ruby",{}], 
    :RUBY_PARAMETER_ID =>["Ruby Parameter ID","variable.parameter",{}],
    :RUBY_REGEXP =>["Regular Expression","string.regexp",{}],
    :RUBY_REQUIRE_CALL =>["Require","keyword.other.special-method.ruby",{}],
    :RUBY_SPECIFIC_CALL =>["Ruby Specific Call","keyword.control.pseudo-method.ruby",{}],
    :RUBY_STRING =>["String","string",{}],
    :RUBY_SYMBOL =>["Symbol","constant.other.symbol",{}]
    }
#    :RUBY_PRIVATE_CALL =>["name","scope",{}],
#    :RUBY_PROTECTED_CALL =>["name","scope",{}],
#    :RUBY_PUBLIC_CALL =>["name","scope",{}],
#    :RUBY_REQUIRE_ARG_CALL=>["name","scope",{}], 
#    :RUBY_SEMICOLON =>["name","scope",{}],
#    :RUBY_WORDS =>["name","scope",{}],
#    :RUBY_PARAMDEF_CALL =>["name","scope",{}],

      @@adjectives = %w(  adorable adventurous aggressive alert attractive average beautiful blue-eyed  bloody blushing bright clean clear cloudy colorful crowded cute dark drab distinct dull elegant excited fancy filthy   glamorous gleaming gorgeous graceful grotesque handsome homely light long magnificent misty motionless muddy old-fashioned plain poised precious quaint shiny smoggy sparkling spotless stormy strange ugly ugliest unsightly unusual wide-eyed 	     alive annoying bad better beautiful brainy breakable busy careful cautious clever clumsy concerned crazy curious dead different difficult doubtful easy expensive famous fragile frail gifted helpful helpless horrible important   	   impossible inexpensive innocent inquisitive modern mushy odd open outstanding poor powerful prickly puzzled real rich shy sleepy stupid super talented tame tender tough uninterested vast wandering wild wrong     angry annoyed anxious arrogant ashamed awful bad bewildered black blue bored clumsy combative condemned confused crazy flipped-out creepy cruel dangerous defeated defiant depressed disgusted disturbed dizzy dull embarrassed envious evil fierce foolish frantic frightened grieving  grumpy helpless homeless hungry hurt ill itchy jealous jittery lazy lonely mysterious nasty  naughty nervous nutty obnoxious outrageous panicky repulsive scary selfish sore tense terrible testy thoughtless tired troubled upset uptight weary wicked worried     agreeable amused brave calm charming cheerful comfortable cooperative courageous delightful determined eager elated enchanting encouraging energetic enthusiastic excited exuberant fair faithful fantastic fine friendly funny gentle glorious good   happy healthy helpful hilarious jolly joyous kind lively lovely lucky nice obedient perfect pleasant proud relieved silly smiling splendid successful thankful thoughtful victorious vivacious witty wonderful zealous zany 	     broad chubby crooked curved deep flat high hollow low narrow round shallow skinny square steep straight wide      big colossal fat gigantic great huge immense large little mammoth massive miniature petite puny scrawny short small tall teeny teeny-tiny tiny     cooing deafening faint harsh high-pitched hissing hushed husky loud melodic moaning mute noisy purring quiet raspy resonant screeching shrill silent soft squealing thundering voiceless whispering 	     ancient brief Early fast late long modern old old-fashioned quick rapid short slow swift young   bitter delicious fresh juicy ripe rotten salty sour spicy stale sticky strong sweet tart tasteless tasty thirsty fluttering fuzzy greasy grubby hard hot icy loose         melted nutritious plastic prickly rainy rough scattered shaggy shaky sharp shivering silky slimy slippery smooth soft solid steady sticky tender tight uneven weak wet wooden yummy     	     boiling breezy broken bumpy chilly cold cool creepy crooked cuddly curly damaged damp dirty dry dusty filthy flaky fluffy freezing hot warm wet    abundant empty few heavy light  numerous substantial  average  big  colossal  fat  giant  gigantic  great  huge  immense  large  little  long  mammoth  massive  miniature  petite  puny  short  small  tall  tiny   boiling  breezy  broken  bumpy  chilly  cold  cool  creepy  crooked  cuddly  curly  damaged  damp  dirty  dry  dusty  filthy  flaky  fluffy  wet  broad  chubby  crooked  curved  deep  flat  high  hollow  low  narrow  round  shallow  skinny  square  steep  straight  wide  ancient  brief  early  fast  late  long  modern  old  old-fashioned  quick  rapid  short  slow  swift  young  abundant  empty  few  heavy  light    Sound  cooing  deafening  faint  harsh  high-pitched  hissing  hushed  husky  loud  melodic  moaning  mute  noisy  purring  quiet  raspy  resonant  screeching  shrill  silent  soft  squealing  thundering  voiceless  whispering   bitter  delicious  fresh  juicy  ripe  rotten  salty  sour  spicy  stale  sticky  strong  sweet  tasteless  tasty  thirsty  fluttering  fuzzy  greasy  grubby  hard  hot  icy  loose  melted  plastic  prickly  rainy  rough  scattered  shaggy  shaky  sharp  shivering  silky  slimy  slippery  smooth  soft  solid  steady  sticky  tender  tight  uneven  weak  wet  wooden  afraid  angry  annoyed  anxious  arrogant  ashamed  awful  bad  bewildered  bored  combative  condemned  confused  creepy  cruel  dangerous  defeated  defiant  depressed  disgusted  disturbed  eerie  embarrassed  envious  evil  fierce  foolish  frantic  frightened  grieving  helpless  homeless  hungry  hurt  ill  jealous  lonely  mysterious  naughty  nervous  obnoxious  outrageous  panicky  repulsive  scary  scornful  selfish  sore  tense  terrible  thoughtless  tired  troubled  upset  uptight  weary  wicked  worried  agreeable  amused  brave  calm  charming  cheerful  comfortable  cooperative  courageous  delightful  determined  eager  elated  enchanting  encouraging  energetic  enthusiastic  excited  exuberant  fair  faithful  fantastic  fine  friendly  funny  gentle  glorious   good  happy  healthy  helpful  hilarious  jolly  joyous  kind  lively  lovely  lucky  obedient  perfect  pleasant  proud  relieved  silly  smiling  splendid  successful  thoughtful  victorious  vivacious  witty  wonderful  zealous  zany  other good new old great high small different large local social important long young national british right early possible big little political able late general full far low public available bad main sure clear major economic only likely real black particular international special difficult certain open whole white free short easy strong european central similar human common necessary single personal hard private poor financial wide foreign simple recent concerned american various close fine english wrong present royal natural individual nice french following current modern labour legal happy final red normal serious previous total prime significant industrial sorry dead specific appropriate top soviet basic military original successful aware hon popular heavy professional direct dark cold ready green useful effective western traditional scottish german independent deep interesting considerable involved physical left hot existing responsible complete medical blue extra past male interested fair essential beautiful civil primary obvious future environmental positive senior nuclear annual relevant huge rich commercial safe regional practical official separate key chief regular due additional active powerful complex standard impossible light warm middle fresh sexual front domestic actual united technical ordinary cheap strange internal excellent quiet soft potential northern religious quick famous cultural proper broad joint formal limited conservative lovely usual ltd unable rural initial substantial christian bright average leading reasonable immediate suitable equal detailed working overall female afraid democratic growing sufficient scientific eastern correct inc irish expensive educational mental dangerous critical increased familiar unlikely double perfect slow tiny dry historical thin daily southern increasing wild alone urban empty married narrow liberal supposed upper apparent tall busy bloody prepared russian moral careful clean attractive japanese vital thick alternative fast ancient elderly rare external capable brief wonderful grand typical entire grey constant vast surprised ideal terrible academic funny minor pleased severe ill corporate negative permanent weak brown fundamental odd crucial inner used criminal contemporary sharp sick near roman massive unique secondary parliamentary african unknown subsequent angry alive guilty lucky enormous well communist yellow unusual net long-term tough dear extensive glad remaining agricultural alright healthy italian principal tired efficient comfortable chinese relative friendly conventional willing sudden proposed voluntary slight valuable dramatic golden temporary federal keen flat silent indian video-taped worried pale statutory welsh dependent firm wet competitive armed radical outside acceptable sensitive living pure global emotional sad secret rapid adequate fixed sweet administrative wooden remarkable comprehensive surprising solid rough mere mass brilliant maximum absolute tory electronic visual electric cool spanish literary continuing supreme chemical genuine exciting written stupid advanced extreme classical fit favourite socialist widespread confident straight catholic proud numerous opposite distinct mad helpful given disabled consistent anxious nervous awful stable constitutional satisfied conscious developing strategic holy smooth dominant remote theoretical outstanding pink pretty clinical minimum honest impressive related residential extraordinary plain visible accurate distant still greek complicated musical precise gentle broken live silly fat tight monetary round psychological violent unemployed inevitable junior sensible grateful pleasant dirty structural welcome so-called deaf above continuous blind overseas mean entitled delighted loose occasional evident desperate fellow universal square steady classic equivalent intellectual victorian level ultimate creative lost medieval clever linguistic convinced judicial raw sophisticated asleep vulnerable illegal outer revolutionary bitter changing australian native imperial strict wise informal flexible collective frequent experimental spiritual intense rational ethnic generous inadequate prominent logical bare historic modest dutch acute electrical valid weekly gross automatic loud reliable mutual liable multiple ruling curious arab sole jewish managing pregnant latin nearby exact underlying identical satisfactory marginal distinctive electoral urgent presidential controversial oral everyday encouraging organic continued expected statistical desirable innocent improved exclusive marked experienced unexpected superb sheer disappointed frightened full-time gastric capitalist romantic naked reluctant magnificent convenient established closed uncertain artificial diplomatic tremendous marine mechanical retail institutional mixed required biological known functional straightforward superior digital part-time spectacular unhappy confused unfair aggressive spare painful abstract asian associated legislative monthly intelligent hungry explicit nasty just faint coloured ridiculous amazing comparable successive working-class realistic back decent unnecessary flying  random influential dull genetic neat marvellous crazy damp giant secure bottom skilled subtle elegant brave lesser parallel steep intensive casual tropical lonely partial preliminary concrete alleged assistant vertical upset delicate mild occupational excessive progressive iraqi exceptional integrated striking continental okay harsh combined fierce handsome characteristic chronic compulsory interim objective splendid magic short-term systematic obliged payable fun horrible primitive fascinating ideological metropolitan surrounding estimated peaceful premier operational technological kind advisory hostile precious gay accessible determined excited impressed provincial smart endless isolated post-war drunk geographical like dynamic boring forthcoming unfortunate definite super notable indirect stiff wealthy awkward lively neutral artistic content mature colonial ambitious evil magnetic verbal legitimate sympathetic well-known empirical head shallow vague naval depressed shared added shocked mid worthwhile qualified missing blank absent favourable polish israeli developed profound representative enthusiastic dreadful rigid reduced cruel coastal peculiar racial ugly swiss crude extended selected eager feminist canadian bold relaxed corresponding running planned applicable immense allied comparative uncomfortable conservation productive beneficial bored charming minimal mobile turkish orange rear passive suspicious overwhelming fatal resulting symbolic registered neighbouring calm irrelevant patient compact profitable rival loyal moderate distinguished interior noble insufficient eligible mysterious varying middle-class managerial molecular olympic linear prospective printed parental diverse elaborate furious fiscal burning useless semantic embarrassed inherent philosophical deliberate awake variable promising unpleasant varied sacred selective inclined tender hidden worthy intermediate sound protective fortunate slim islamic defensive divine stuck driving invisible misleading circular mathematical inappropriate liquid persistent solar doubtful manual architectural intact incredible devoted prior tragic respectable optimistic convincing unacceptable decisive competent spatial respective binding relieved nursing toxic select redundant integral then probable amateur fond passing specified territorial horizontal old-fashioned inland cognitive regulatory miserable resident polite scared marxist gothic civilian instant lengthy adverse korean unconscious anonymous aesthetic orthodox static unaware costly fantastic foolish fashionable causal compatible wee implicit dual ok cheerful subjective forward surviving exotic purple cautious visiting aggregate ethical protestant teenage large-scale dying disastrous delicious confidential underground thorough grim autonomous atomic frozen colourful injured uniform ashamed glorious wicked coherent rising shy novel balanced delightful arbitrary adjacent psychiatric worrying weird unchanged rolling evolutionary intimate sporting disciplinary formidable lexical noisy gradual accused homeless supporting coming renewed excess retired rubber chosen outdoor embarrassing preferred bizarre appalling agreed imaginative governing accepted vocational palestinian mighty puzzled worldwide handicapped organisational sunny eldest eventual spontaneous vivid rude nineteenth-century faithful ministerial innovative controlled conceptual unwilling civic meaningful disturbing alive  brainy  breakable  busy  careful  cautious  clever  concerned  crazy  curious  dead  different  difficult  doubtful  easy  famous  fragile  helpful  helpless  important   impossible  innocent  inquisitive  modern  open  outstanding  poor  powerful  puzzled  real  rich  shy  sleepy  stupid  super  tame  uninterested  wandering  wild  wrong   adorable  alert  average  beautiful  blonde  bloody  blushing  bright  clean  clear  cloudy  colorful  crowded  cute  dark  drab  distinct  dull  elegant  fancy  filthy  glamorous  gleaming  graceful  grotesque  homely  light  misty  motionless  muddy  plain  poised  quaint  shiny  smoggy  sparkling  spotless  stormy  strange  ugly  unsightly  unusual  bad better beautiful big black blue bright clumsy  crazy dizzy dull fat frail friendly funny great green gigantic gorgeous grumpy  handsome happy horrible itchy jittery jolly kind long lazy magnificent  magenta many mighty mushy nasty new nice nosy nutty nutritious  odd orange ordinary pretty precious prickly purple quaint quiet quick quickest rainy rare ratty red roasted robust round sad scary scrawny short silly stingy strange striped spotty tart tall tame tan tender testy tricky tough ugly ugliest vast watery wasteful  wide-eyed wonderful yellow yummy zany peer-to-peer  )

      @@nouns = %w(aardvark able Abyssinian accelerator accordion account accountant achieve acknowledgment acoustic acrylic act action active activity actor actress adapter addition address adjustment advantage advertisement advice Afghanistan Africa aftermath afternoon aftershave afterthought age agenda agreement air airbus airmail airplane airport airship alarm albatross alcohol algebra Algeria alibi alley alligator alloy almanac alphabet alto aluminium aluminum ambulance America American amount amusement anatomy anethesiologist anger angle Angora animal anime ankle answer ant Antarctica anteater Anthony anthropology apartment apology apparatus apparel appeal appendix apple appliance apply approval April Aquarius arch archaeology archeology archer architecture area Argentina argument Aries arithmetic arm armadillo armchair armed Armenian army arrow art ash ashtray Asia asparagus asphalt asterisk astronomy athlete ATM atom atomic attack attempt attention attic attraction August aunt Australia Australian author authority authorization avenue baboon baby back backbone bacon badge badger bag bagel bagpipe bail bait baker bakery balance Balinese ball balloon bamboo banana band bandana Bangladesh banjo bank bankbook banker bar Barbara barber barge baritone barometer base baseball basement basin basket basketball bass bassoon bat bath bathroom bathtub battery battle bay beach bead beam bean bear beard beast beat beautician beauty beaver bed bedroom bee beech beef beer beet beetle beggar beginner begonia behavior Belgian belief believe bell belt bench Bengal beret berry bestseller Betty bibliography bicycle bike bill billboard biology biplane birch bird birth birthday bit bite black bladder blade blanket blinker blizzard block blood blouse blow blowgun blue board boat bobcat body bomb bomber bone bongos bonsai book bookcase booklet boot border botany bottle bottom boundary bow bowling box boy bra brace bracket brain brake branch brand brandy brass Brazil bread break breakfast breath Brian brick bridge British broccoli brochure broker bronze brother brother-in-law brow brown brush bubble bucket budget buffer buffet bugle building bulb bull bulldozer bumper bun burglar Burma burn burst bus bush business butane butcher butter button buzzard cabbage cabinet cable cactus cafe cake calculator calculus calendar calf call camel camera camp Canada Canadian Cancer candle cannon canoe canvas cap capital cappelletti Capricorn captain caption car carbon card cardboard cardigan care carnation Carol carp carpenter carriage carrot cart cartoon case cast castanet cat catamaran caterpillar cathedral catsup cattle cauliflower cause caution cave C-clamp CD ceiling celery celeste cell cellar cello Celsius cement cemetery cent centimeter century ceramic cereal certification chain chair chalk chance change channel character chard Charles chauffeur check cheek cheese cheetah chef chemistry cheque cherry chess chest chick chicken chicory chief child children chill chimpanzee chin China Chinese chive chocolate chord Christmas Christopher chronometer church cicada cinema circle circulation cirrus citizenship city clam clarinet Claus clave clef clerk click client climb clipper cloakroom clock close closet cloth cloud cloudy clover club clutch coach coal coast coat cobweb cockroach cocktail cocoa cod coffee coil coin coke cold collar college collision Colombia colon colony color colt column columnist comb comfort comics comma command commission committee community company comparison competition competitor composer composition computer condition condor cone confirmation conga Congo conifer connection consonant continent control cook cooking copper copy copyright cord cork cormorant corn cornet correspondent cost cotton couch cougar cough country course court cousin cover cow cowbell crab crack cracker craftsman crate crawdad crayfish crayon cream creator creature credit creditor creek crib cricket crime criminal crocodile crocus croissant crook crop cross crow crowd crown crush cry cub Cuban cucumber cultivator cup cupboard curler currency current curtain curve cushion customer cut cuticle cycle cyclone cylinder cymbal dad daffodil dahlia daisy damage dance danger Daniel dash dashboard database date daughter David day dead deadline deal death Deborah debt debtor decade December decimal decision decrease dedication deer defense deficit degree delete delivery den denim dentist deodorant department deposit description desert design desire desk dessert destruction detail detective development dew diamond diaphragm dibble dictionary dietician difference digestion digger digital dill dime dimple dinghy dinner dinosaur diploma dipstick direction dirt disadvantage discovery discussion disease disgust dish distance distribution distributor diving division divorced dock doctor dog dogsled doll dollar dolphin domain Donald donkey Donna door Dorothy double doubt downtown dragon dragonfly drain drake drama draw drawbridge drawer dream dredger dress dresser dressing drill drink drive driver driving drizzle drop drug drum dry dryer duck duckling dugout dungeon dust eagle ear earth earthquake ease east edge edger editor editorial education Edward eel effect egg eggnog eggplant Egypt eight elbow element elephant Elizabeth ellipse emery employee employer encyclopedia end enemy energy engine engineer engineering English enquiry entrance environment epoch epoxy equinox equipment era error estimate ethernet Ethiopia euphonium Europe evening event examination example exchange exclamation exhaust ex-husband existence expansion experience expert explanation ex-wife eye eyebrow eyeliner face facilities fact factory Fahrenheit fairies fall family fan fang farm farmer fat father father-in-law faucet fear feast feather feature February fedelini feedback feeling feet felony female fender ferry ferryboat fiber fiberglass fibre fiction field fifth fight fighter file find fine finger fir fire fired fireman fireplace firewall fish fisherman flag flame flare flat flavor flax flesh flight flock flood floor flower flugelhorn flute fly foam fog fold font food foot football footnote force forecast forehead forest forgery fork form format fortnight foundation fountain fowl fox foxglove fragrance frame France freckle freeze freezer freighter French freon friction Friday friend frog front frost fruit fuel fur furniture galley gallon game gander garage garden garlic gas gasoline gate gateway gauge gazelle gear gearshift geese Gemini gender geography geology geometry George geranium German Germany Ghana ghost giraffe girdle girl gladiolus glass glider gliding glockenspiel glove glue goal goat gold goldfish golf gondola gong good-bye goose gore-tex gorilla gosling government governor grade grain gram granddaughter grandfather grandmother grandson grape graphic grass grasshopper gray grease great-grandfather great-grandmother Greece Greek green grenade grey grill grip ground group grouse growth guarantee Guatemalan guide guilty guitar gum gun gym gymnast hacksaw hail hair haircut half-brother half-sister halibut hall hallway hamburger hammer hamster hand handball handicap handle handsaw harbor hardboard hardcover hardhat hardware harmonica harmony harp hat hate hawk head headlight headline health hearing heart heat heaven hedge height Helen helicopter helium hell helmet help hemp hen heron herring hexagon hill Himalayan hip hippopotamus history hockey hoe hole holiday home honey hood hook hope horn horse hose hospital promenade hour hourglass house hovercraft hub hubcap humidity humor hurricane hyacinth hydrant hydrofoil hydrogen hyena hygienic ice icebreaker icicle icon idea ikebana illegal imprisonment improvement impulse inch income increase index India Indonesia industry ink innocent input insect instruction instrument insulation insurance interactive interest Internet interviewer intestine invention inventory invoice Iran Iraq iris iron island Israel Italian Italy jacket jaguar jail jam James January Japan Japanese jar jasmine Jason jaw jeans jeep Jeff jelly jellyfish Jennifer jet jewel jogging John join joke Joseph journey judge judo juice July jumbo jump jumper June jury justice jute kale kamikaze kangaroo karate Karen kayak kendo Kenneth Kenya ketchup kettle kettledrum Kevin key keyboard keyboarding kick kilogram kilometer Kimberly kiss kitchen kite kitten kitty knee knickers knife knight knot knowledge kohlrabi Korean laborer lace ladybug lake lamb lamp lan land landmine language larch lasagna latency latex lathe laugh laundry Laura law lawyer layer lead leaf learning leather leek leg legal lemonade lentil Leo leopard letter lettuce level Libra library license lier lift light lightning lilac lily limit Linda line linen link lion lip lipstick liquid liquor Lisa list literature litter liver lizard llama loaf loan lobster lock locket locust look loss lotion love low lumber lunch lunchroom lung lute luttuce lycra lynx lyocell lyre lyric macaroni machine macrame magazine magic magician maid mail mailbox mailman makeup Malaysia male mall mallet man manager mandolin manicure Manx map maple maraca marble March Margaret margin Maria marimba mark Mark market married Mary mascara mask mass match math mattock May mayonnaise meal measure meat mechanic medicine meeting melody memory men menu mercury message metal meteorology meter methane Mexican Mexico mice Michael Michelle microwave middle mile milk milkshake millennium millimeter millisecond mimosa mind mine minibus mini-skirt minister mint minute mirror missile mist mistake mitten moat modem mole mom Monday money monkey month moon morning Morocco mosque mosquito mother mother-in-law motion motorboat motorcycle mountain mouse moustache mouth move multi-hop multimedia muscle museum music musician mustard Myanmar nail name Nancy napkin narcissus nation neck need needle neon Nepal nephew nerve nest net network news newsprint newsstand nic nickel niece Nigeria night nitrogen node noise noodle north North America North Korea Norwegian nose note notebook notify novel November number numeric nurse nut nylon oak oatmeal objective oboe observation occupation ocean ocelot octagon octave October octopus odometer offence offer office oil okra olive onion open opera operation ophthalmologist opinion option orange orchestra orchid order organ organisation organization ornament ostrich otter ounce output outrigger oval oven overcoat owl owner ox oxygen oyster packet page pail pain paint pair pajama Pakistan pamphlet pan pancake pancreas panda pansy panther panties pantry pants panty pantyhose paper paperback parade parallelogram parcel parent parentheses park parrot parsnip part particle partner partridge party passbook passenger passive pasta paste pastor pastry patch path patient patio Patricia Paul payment pea peace peak peanut pear pedestrian pediatrician peen  pelican pen penalty pencil pendulum pentagon peony pepper perch perfume period periodical peripheral permission Persian person Peru pest pet pharmacist pheasant Philippines philosophy phone physician piano piccolo pickle picture pie pig pigeon pike pillow pilot pimple pin pine ping pink pint pipe Pisces pizza place plain plane plant plantation plaster plasterboard plastic plate platinum play playground playroom pleasure plier plot plough plow plywood pocket poet point poison Poland police policeman polish politician pollution polo polyester pond popcorn poppy porch porcupine port porter position possibility postage postbox pot potato poultry pound powder power precipitation preface prepared pressure price priest print printer prison probation process processing produce product production professor profit promotion propane property prose prosecution protest protocol pruner psychiatrist psychology ptarmigan puffin pull puma pump pumpkin punch punishment puppy purchase purple purpose push PVC pyjama pyramid quail quality quart quarter quartz queen question quicksand quiet quill quilt quince quit quiver quotation rabbi rabbit racing radar radiator radio radish raft rail railway rain rainbow raincoat rainstorm rake ramie  range rat rate raven ravioli ray rayon reaction reading reason receipt recess record recorder rectangle red reduction refrigerator refund regret reindeer relation relatives religion relish reminder repair replace report representative request resolution respect responsibility rest restaurant result retailer revolve revolver reward rhinoceros rhythm rice Richard riddle rifle ring rise risk river riverbed road roadway roast Robert robin rock rod roll Romania Romanian Ronald roof room rooster root rose rotation route router rowboat rub rubber rugby rule run Russia Russian rutabaga Ruth sack Sagittarius sail sailboat sailor salad salary sale salesman salmon salt sampan samurai sand Sandra sandwich Santa Sarah sardine satin Saturday sauce Saudi Arabia sausage save saw saxophone scale scallion scanner scarecrow scarf scene scent schedule school science scissors scooter Scorpio scorpion scraper screw screwdriver sea seagull seal seaplane search seashore season seat second secretary secure security seed seeder segment select selection self semicircle semicolon sense sentence separated September servant server session sex shade shadow shake shallot shame shampoo shape share shark Sharon shears sheep sheet shelf shell shield shingle ship shirt shock shoe shoemaker shop shorts shoulder shovel show shrimp shrine Siamese Siberian side sideboard sidecar sidewalk sign signature silica silk silver sing singer single sink sister sister-in-law size skate skiing skill skin skirt sky slash slave sled sleep sleet slice slip slippers slope smash smell smile smoke snail snake sneeze snow snowboarding snowflake snowman snowplow snowstorm soap soccer society sociology sock soda sofa softball softdrink software soldier son song soprano sound soup sousaphone South Africa South America South Korea soy soybean space spade spaghetti Spain spandex spark sparrow spear specialist speedboat sphere Sphynx spider spinach spleen sponge spoon spot spring sprout spruce spy square squash squid squirrel stage staircase stamp star start starter state statement station statistic steam steel stem step step-aunt step-brother stepdaughter step-daughter step-father step-grandfather step-grandmother stepmother step-mother step-sister stepson step-son step-uncle Steven stew stick stitch stock stocking stomach stone stool stop stopwatch store storm story stove stranger straw stream street streetcar stretch string structure study sturgeon submarine substance subway success Sudan suede sugar suggestion suit summer sun Sunday sundial sunflower supermarket supply support surfboard surgeon surname surprise Susan sushi swallow swamp swan sweater sweatshirt sweatshop Swedish sweets swim swimming swing Swiss switch sword swordfish sycamore Syria syrup system table tachometer tadpole tail tailor Taiwan talk tank tanker Tanzania target taste Taurus tax taxi taxicab tea teacher teaching team technician teeth television teller temper temperature temple tempo tendency tennis tenor tent territory test text textbook texture Thailand theater theory thermometer thing thistle Thomas thought thread thrill throat throne thumb thunder thunderstorm Thursday ticket tie tiger tights tile timbales time timer timpani tin tip tire titanium title toad toast toe toilet tomato tomatoes tom-tom ton tongue tooth toothbrush toothpaste top tornado tortellini tortoise touch tower town toy tractor trade traffic trail train tramp transaction transmission transport trapezoid tray treatment tree trial triangle trick trigonometry trip trombone trouble trousers trout trowel truck trumpet trunk t-shirt tsunami tub tuba Tuesday tugboat tulip tuna tune Turkey Turkish turn turnip turnover turret turtle TV twig twilight twine twist typhoon tyvek Uganda Ukraine Ukrainian umbrella uncle underclothes underpants undershirt underwear unit United Kingdom unshielded utensil Uzbekistan vacation vacuum valley value van vase vault vegetable vegetarian veil vein velvet Venezuela Venezuelan verdict vermicelli verse vessel vest veterinarian vibraphone Vietnam view vinyl viola violet violin Virgo viscose vise vision visitor voice volcano volleyball voyage vulture waiter waitress wall wallaby walrus war warm wash washer wasp waste watch watchmaker water waterfall wave wax way wealth weapon weasel weather wedge Wednesday weeder week weight whale wheel whip whiskey whistle white wholesaler whorl wilderness William willow wind windchime window windscreen windshield wine wing winter wire wish withdrawal witness wolf woman women wood wool woolen word work workshop worm wound wrecker wren wrench wrinkles wrist writer xylophone yacht yam yard year yellow yew yogurt Yugoslavian zebra zinc zone zoology
      )

      #this is for making textmate themes
      @@scopes_found = ['meta.selector.css entity.name.tag', 'markup.list', 'keyword', 'entity.name.tag', 'storage', 'keyword.operator.js', 'constant.character.escape, string source', 'invalid.deprecated', 'source string source punctuation.section.embedded', 'meta.tag', 'support.other.variable', 'meta.sgml.html meta.doctype, meta.sgml.html meta.doctype entity, meta.sgml.html meta.doctype string, meta.xml-processing, meta.xml-processing entity, meta.xml-processing string', 'meta.section entity.name.section, declaration.section entity.name.section', 'meta.preprocessor.at-rule keyword.control.at-rule', 'comment.block', 'invalid', 'keyword.other', 'support.constant', 'source.ocaml keyword.operator.symbol.prefix.floating-point', 'text source, string.unquoted', 'keyword.control.import', 'string', 'source comment.block', 'keyword.other.unit.css, constant.other.rgb-value.css, constant.numeric.css', 'entity.name.type', 'meta.constructor.argument.css', 'meta.preprocessor.c keyword', 'declaration.tag, declaration.tag entity, meta.tag, meta.tag entity', 'markup.italic', 'support.class, support.type', 'variable.other.constant', 'string.quoted.docinfo.doctype.DTD', 'declaration.sgml.html declaration.doctype, declaration.sgml.html declaration.doctype entity, declaration.sgml.html declaration.doctype string, declaration.xml-processing, declaration.xml-processing entity, declaration.xml-processing string', 'support.type, support.class', 'meta.property-group support.constant.property-value.css, meta.property-value support.constant.property-value.css', 'meta.diff, meta.diff.header, meta.separator', 'markup.heading, markup.heading entity', 'meta.tag, declaration.tag', 'meta.preprocessor', 'string.interpolated constant.character.escape', 'text', 'entity.name.tag.namespace, entity.other.attribute-name.namespace', 'variable.parameter', 'markup.underline', 'keyword.control', 'entity.name.function, keyword.other.name-of-parameter.objc', 'comment', 'entity.name.function', 'meta.tag.preprocessor.xml', 'meta.selector.css, entity.other.attribute-name.pseudo-class.css, entity.name.tag.wildcard.css, entity.other.attribute-name.id.css, entity.other.attribute-name.class.css', 'meta.selector.css entity.other.attribute-name.class', 'entity.name.class', 'string.regexp constant.character.escape, string.regexp source.ruby.embedded, string.regexp string.regexp.arbitrary-repitition', 'constant', 'constant.numeric', 'support.type', 'source', 'meta.tag, meta.tag entity', 'source entity.name.tag, source entity.other.attribute-name, meta.tag.inline, meta.tag.inline entity', 'markup.inserted', 'support.variable', 'string constant', 'variable.language, variable.other', 'entity.name.section', 'string.regexp.character-class', 'storage.type', 'string constant.character.escape', 'meta.function-call.py', 'meta.diff, meta.diff.header', 'entity.name.function, support.function.any-method', 'string variable', 'punctuation', 'variable.other', 'meta.tag, declaration.tag, entity.name.tag, entity.other.attribute-name', 'string.regexp.group', 'meta.preprocessor.c', 'support.function', 'markup.raw', 'source.ocaml keyword.operator.symbol.prefix', 'meta.separator', 'entity.name', 'other.preprocessor.c', 'support.type.property-name.css', 'other.preprocessor', 'variable', 'source.ocaml constant.numeric.floating-point', 'string source', 'declaration.tag.inline, declaration.tag.inline entity, source entity.name.tag, source entity.other.attribute-name, meta.tag.inline, meta.tag.inline entity', 'markup.changed', 'keyword.operator', 'constant.language', 'entity.other.attribute-name', 'meta.selector.css entity.other.attribute-name.tag.pseudo-class', 'source.ocaml keyword.operator.symbol.infix', 'string, meta.verbatim', 'string.regexp', 'markup.quote', 'entity.other.inherited-class', 'text.html.ruby source', 'markup.bold', 'meta.line.entry.logfile, meta.line.exit.logfile', 'support', 'source string source', 'entity', 'markup.heading', 'keyword.type.variant', 'meta.selector.css entity.other.attribute-name.id', 'constant.character.escaped, constant.character.escape, string source, string source.ruby', 'source.ocaml keyword.operator.symbol.infix.floating-point', 'storage.modifier', 'text source', 'meta.cast', 'string.interpolated', 'storage.type.method', 'keyword.other.unit', 'constant.character, constant.other', 'markup.deleted', 'markup comment', 'meta.diff.header, meta.separator.diff, meta.diff.index, meta.diff.range', 'meta.tag.sgml.doctype, meta.tag.sgml.doctype entity, meta.tag.sgml.doctype string, meta.tag.preprocessor.xml, meta.tag.preprocessor.xml entity, meta.tag.preprocessor.xml string', 'entity.name.preprocessor', 'string.quoted source', 'constant.character', 'string.literal', 'string constant.other.placeholder', 'keyword, storage', 'invalid.illegal', 'meta.line.error.logfile', 'invalid.trailing-whitespace', 'meta.property-value support.constant.named-color.css, meta.property-value constant', 'invalid.deprecated.trailing-whitespace', ]
      
      @@geany_filetypes_post =    <<-HERE
      
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
    HERE


@@mybanner= <<-hhh


hhh
# foreground;background;bold;italic
      
@@geany_tokens = %w{ html_default  html_tag html_tagunknown  html_attribute html_attributeunknown  html_number html_doublestring html_singlestring html_other  html_comment html_entity  html_tagend   html_xmlstart html_xmlend html_script html_asp  html_aspat html_cdata html_question html_value html_xccomment  sgml_default sgml_comment sgml_special sgml_command sgml_doublestring sgml_simplestring sgml_1st_param sgml_entity sgml_block_default sgml_1st_param_comment sgml_error  php_default  php_simplestring php_hstring php_number php_word php_variable php_comment php_commentline php_operator php_hstring_variable php_complex_variable  jscript_start jscript_default jscript_comment jscript_commentline jscript_commentdoc jscript_number jscript_word jscript_keyword jscript_doublestring jscript_singlestring jscript_symbols jscript_stringeol jscript_regex }     #end 

@@geany_ruby_tokens =%w{default commentline number string character word global symbol classname defname
operator identifier modulename backticks instancevar classvar heredelim worddemoted stdin stdout stderr
datasection regex here_q here_qq here_qx string_q string_qq string_qx string_qr string_qw upper_bound error
pod }
    
@@geany_file_contents = {:h=>"y"}

@@geany_file_contents[:yaml] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
identifier=0x999966;0x000000;true;false
keyword=0xff6600;0x000000;true;false
number=0xff8000;0x000000;false;false
reference=0xedf8f9;0x000000;false;false
document=0xffff00;0x000000;false;false
text=0xff8800;0x000000;false;false
error=0xff0000;0x000000;true;true
operator=0xffcc00;0x000000;false;false


[keywords]
# all items must be in one line
keywords=true false yes no


[settings]
# default extension used when saving files
extension=yaml

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=
ERRREEEEE
@@geany_file_contents[:xml] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
html_default=0xffffff;0x1E1E1E;false;false
html_tag=0x7392CF;0x1E1E1E;true;false
html_tagunknown=0xffffff;0x8C0101;true;false
html_attribute=0xCDA0D5;0x1E1E1E;false;false
html_attributeunknown=0xffffff;0x8C0101;false;false
html_number=0x800080;0x1E1E1E;false;false
html_doublestring=0xA8E498;0x1E1E1E;false;false
html_singlestring=0xA8E498;0x1E1E1E;false;false
html_other=0xffffff;0x1E1E1E;false;false
html_comment=0x747474;0x1E1E1E;false;false
html_entity=0xFFA95C;0x2C2821;false;false
html_tagend=0x7392CF;0x1E1E1E;true;false
# <?
html_xmlstart=0x000099;0xf0f0f0;false;false
# ?>
html_xmlend=0xffffff;0x1E1E1E;false;false
# <script
html_script=0xffffff;0x1E1E1E;false;false
# <% ... %>
html_asp=0xffffff;0x1E1E1E;false;false
# <%@ ... %>
html_aspat=0xffffff;0x1E1E1E;false;false
html_cdata=0xffffff;0x1E1E1E;false;false
html_question=0xffffff;0x1E1E1E;false;false
html_value=0xffffff;0x1E1E1E;false;false
html_xccomment=0xffffff;0x1E1E1E;false;false

sgml_default=0xffffff;0x4C1700;false;false
sgml_comment=0x747474;0x4C1700;false;false
sgml_special=0xffffff;0x4C1700;false;false
sgml_command=0xfffffff;0x4C1700;true;false
sgml_doublestring=0xA8E498;0x4C1700;false;false
sgml_simplestring=0xA8E498;0x4C1700;false;false
sgml_1st_param=0xffffff;0x4C1700;false;false
sgml_entity=0xFFA95C;0x4C1700;false;false
sgml_block_default=0xffffff;0x4C1700;false;false
sgml_1st_param_comment=0xffffff;0x4C1700;false;false
sgml_error=0xff0000;0x4C1700;false;false

php_default=0xffffff;0x1E1E1E;false;false
php_simplestring=0xA18651;0x1E1E1E;false;false
php_hstring=0xA18651;0x1E1E1E;false;false
php_number=0x7ECDFF;0x1E1E1E;false;false
php_word=0xFFCB4F;0x1E1E1E;true;false
php_variable=0xffffff;0x1E1E1E;false;false
php_comment=0x747474;0x1E1E1E;false;false
php_commentline=0x747474;0x1E1E1E;false;false
php_operator=0x98BAC5;0x1E1E1E;false;false
php_hstring_variable=0xffffff;0x1E1E1E;false;false
php_complex_variable=0xffffff;0x1E1E1E;false;false

jscript_start=0x008080;0x1E1E1E;false;false
jscript_default=0xffffff;0x1E1E1E;false;false
#jscript_comment=0x222222;0x1E1E1E;false;false
#jscript_commentline=0x808080;0x1E1E1E;false;false
#jscript_commentdoc=0x3f5fbf;0x1E1E1E;false;false
#jscript_number=0x006060;0x1E1E1E;false;false
#jscript_word=0x0000ff;0x1E1E1E;false;false
#jscript_keyword=0x501000;0x1E1E1E;false;false
jscript_doublestring=0xff901e;0x1E1E1E;false;false
jscript_singlestring=0xff901e;0x1E1E1E;false;false
#jscript_symbols=0x001050;0x1E1E1E;false;false
#jscript_stringeol=0x000000;0x1E1E1E;false;false

jscript_comment=0x747474;0x1E1E1E;false;false
jscript_commentline=0x747474;0x1E1E1E;false;false
jscript_commentdoc=0x747474;0x1E1E1E;false;false
jscript_number=0x7ECDFF;0x1E1E1E;false;false
jscript_word=0xFFCB4F;0x1E1E1E;false;false
jscript_keyword=0xAAFF57;0x1E1E1E;true;false
jscript_symbols=0x98BAC5;0x1E1E1E;true;false
jscript_stringeol=0xffffff;0xffffff;true;false


[keywords]
html=a abbr acronym address applet area b base basefont bdo big blockquote body br button caption center cite code col colgroup dd del dfn dir div dl dt em embed fieldset font form frame frameset h1 h2 h3 h4 h5 h6 head hr html i iframe img input ins isindex kbd label legend li link map menu meta noframes noscript object ol optgroup option p param pre q quality s samp script select small span strike strong style sub sup table tbody td textarea tfoot th thead title tr tt u ul var xmlns leftmargin topmargin abbr accept-charset accept accesskey action align alink alt archive axis background bgcolor border cellpadding cellspacing char charoff charset checked cite class classid clear codebase codetype color cols colspan compact content coords data datafld dataformatas datapagesize datasrc datetime declare defer dir disabled enctype face for frame frameborder selected headers height href hreflang hspace http-equiv id ismap label lang language link longdesc marginwidth marginheight maxlength media framespacing method multiple name nohref noresize noshade nowrap object onblur onchange onclick ondblclick onfocus onkeydown onkeypress onkeyup onload onmousedown onmousemove onmouseover onmouseout onmouseup onreset onselect onsubmit onunload profile prompt pluginspage readonly rel rev rows rowspan rules scheme scope scrolling shape size span src standby start style summary tabindex target text title type usemap valign value valuetype version vlink vspace width text password checkbox radio submit reset file hidden image public doctype xml
javascript=break this for while null else var false void new delete typeof if in continue true function with return case super extends do const try debugger catch switch finally enum export default class throw import length concat join pop push reverse shift slice splice sort unshift Date Infinity NaN undefined escape eval isFinite isNaN Number parseFloat parseInt string unescape Math abs acos asin atan atan2 ceil cos exp floor log max min pow random round sin sqrt tan MAX_VALUE MIN_VALUE NEGATIVE_INFINITY POSITIVE_INFINITY toString valueOf String length anchor big bold charAt charCodeAt concat fixed fontcolor fontsize fromCharCode indexOf italics lastIndexOf link slice small split strike sub substr substring sup toLowerCase toUpperCase
vbscript=and as byref byval case call const continue dim do each else elseif end error exit false for function global goto if in loop me new next not nothing on optional or private public redim rem resume select set sub then to true type while with boolean byte currency date double integer long object single string type variant
python=and assert break class continue complex def del elif else except exec finally for from global if import in inherit is int lambda not or pass print raise return tuple try unicode while yield long float str list
php=and or xor FILE exception LINE array as break case class const continue declare default die do echo else elseif empty  enddeclare endfor endforeach endif endswitch endwhile eval exit extends for foreach function global if include include_once  isset list new print require require_once return static switch unset use var while FUNCTION CLASS METHOD final php_user_filter interface implements extends public private protected abstract clone try catch throw cfunction old_function this
sgml=ELEMENT DOCTYPE ATTLIST ENTITY NOTATION


[settings]
# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=<!--
comment_close=-->

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
        #command_example();
# setting to false would generate this
#       command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:vhdl] = <<-ERRREEEEE
  # For complete documentation of this file, please see Geany's main documentation
  [styling]
  # foreground;background;bold;italic
  default=0xffffff;0x000000;false;false
  comment=0x9933cc;0x000000;false;false
  comment_line_bang=0x9933cc;0x000000;false;false;
  number=0xff8000;0x000000;false;false
  string=0x66ff00;0x000000;false;false
  operator=0xffcc00;0x000000;false;false
  identifier=0xffffff;0x000000;false;false
  stringeol=0x66ff00;0x000000;false;false
  keyword=0xff6600;0x000000;true;false
  stdoperator=0x0080c0;0x000000;false;false
  attribute=0x8080ff;0xffffcc;false;false
  stdfunction=0x339999;0x000000;true;false
  stdpackage=0x800000;0x000000;false;false
  stdtype=0x66ff00;0x000000;false;false
  userword=0xb5e71f;0x000000;true;false

  [keywords]
  # all items must be in one line
  keywords=access after alias all architecture array assert attribute begin block body buffer bus case component configuration constant disconnect downto else elsif end entity exit file for function generate generic group guarded if impure in inertial inout is label library linkage literal loop map new next null of on open others out package port postponed procedure process pure range record register reject report return select severity shared signal subtype then to transport type unaffected units until use variable wait when while with
  operators=abs and mod nand nor not or rem rol ror sla sll sra srl xnor xor
  attributes=left right low high ascending image value pos val succ pred leftof rightof base range reverse_range length delayed stable quiet transaction event active last_event last_active last_value driving driving_value simple_name path_name instance_name
  std_functions=now readline read writeline write endfile resolved to_bit to_bitvector to_stdulogic to_stdlogicvector to_stdulogicvector to_x01 to_x01z to_UX01 rising_edge falling_edge is_x shift_left shift_right rotate_left rotate_right resize to_integer to_unsigned to_signed std_match to_01
  std_packages=std ieee work standard textio std_logic_1164 std_logic_arith std_logic_misc std_logic_signed std_logic_textio std_logic_unsigned numeric_bit numeric_std math_complex math_real vital_primitives vital_timing
  std_types=boolean bit character severity_level integer real time delay_length natural positive string bit_vector file_open_kind file_open_status line text side width std_ulogic std_ulogic_vector std_logic std_logic_vector X01 X01Z UX01 UX01Z unsigned signed
  userwords=

  [settings]
  # default extension used when saving files
  #extension=vhd

  # the following characters are these which a "word" can contains, see documentation
  #wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

  # if only single comment char is supported like # in this file, leave comment_close blank
  comment_open=--
  comment_close=

  # set to false if a comment character/string should start at column 0 of a line, true uses any
  # indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
    #command_example();
  # setting to false would generate this
  #	command_example();
  # This setting works only for single line comments
  comment_use_indent=true

  # context action command (please see Geany's main documentation for details)
  context_action_cmd=



ERRREEEEE
@@geany_file_contents[:vala] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0x000000
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
# all items must be in one line
#primary=
#secondary=
# these are some doxygen keywords (incomplete)
#docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=vala

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
#comment_open=//
#comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
#comment_use_indent=true

# context action command (please see Geany's main documentation for details)
#context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=valac -c "%f"
linker=valac "%f"
run_cmd=./"%e"

ERRREEEEE
@@geany_file_contents[:tcl] = <<-ERRREEEEE
# For complete documentation of this file; please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
wordinquote=0x66ff00;0x000000;false;false
inquote=0x66ff00;0x000000;false;false
substitution=0xffffff;0x000000;false;false
modifier=0x99cc99;0x000000;false;false
expand=0xffffff;0x000000;false;false
wordtcl=0xff6600;0x000000;true;false
wordtk=0xff6600;0x000000;true;false
worditcl=0xff6600;0x000000;true;false
wordtkcmds=0xff6600;0x000000;true;false
wordexpand=0xff6600;0x000000;true;false


[keywords]
# all items must be in one line
tcl=after append apply array auto_execok auto_import auto_load auto_load_index auto_mkindex auto_mkindex_old auto_qualify auto_reset beep bgerror binary break case catch cd chan clock close concat continue coroutine dde default dict echo else elseif encoding eof error eval exec exit expr fblocked fconfigure fcopy file fileevent filename flush for foreach format gets glob global history http if incr info interp join lappend lassign lindex linsert list llength load loadTk lrange lrepeat lreplace lreverse lsearch lset lsort mathfunc mathop memory msgcat namespace oo::class oo::copy oo::define oo::objdefine oo::object open package parray pid pkg::create pkg_mkIndex platform platform::shell Platform-specific proc puts pwd read refchan regexp registry regsub rename resource re_syntax return Safe Base scan seek set socket source split string subst switch tailcall Tcl tcl::prefix tcl_endOfWord tcl_findLibrary tclLog tclMacPkgSearch tclPkgSetup tclPkgUnknown tcl_startOfNextWord tcl_startOfPreviousWord tcltest tclvars tcl_wordBreakAfter tcl_wordBreakBefore tell throw time tm trace try unknown unload unset update uplevel upvar variable vwait while yield zlib
tk=bell bind bindtags bitmap button canvas checkbutton clipboard colors console cursors destroy entry event focus font frame grab grid image Inter-client keysyms label labelframe listbox loadTk lower menu menubutton message option options pack panedwindow photo place radiobutton raise scale scrollbar selection send spinbox text toplevel winfo wish wm
itcl=@scope body class code common component configbody constructor define destructor hull import inherit itcl itk itk_component itk_initialize itk_interior itk_option iwidgets keep method private protected public
tkcommands=tk tk_bisque tkButtonAutoInvoke tkButtonDown tkButtonEnter tkButtonInvoke tkButtonLeave tkButtonUp tkCancelRepeat tkCheckRadioDown tkCheckRadioEnter tkCheckRadioInvoke tk_chooseColor tk_chooseDirectory tkColorDialog tkColorDialog_BuildDialog tkColorDialog_CancelCmd tkColorDialog_Config tkColorDialog_CreateSelector tkColorDialog_DrawColorScale tkColorDialog_EnterColorBar tkColorDialog_HandleRGBEntry tkColorDialog_HandleSelEntry tkColorDialog_InitValues tkColorDialog_LeaveColorBar tkColorDialog_MoveSelector tkColorDialog_OkCmd tkColorDialog_RedrawColorBars tkColorDialog_RedrawFinalColor tkColorDialog_ReleaseMouse tkColorDialog_ResizeColorBars tkColorDialog_RgbToX tkColorDialog_SetRGBValue tkColorDialog_StartMove tkColorDialog_XToRgb tkConsoleAbout tkConsoleBind tkConsoleExit tkConsoleHistory tkConsoleInit tkConsoleInsert tkConsoleInvoke tkConsoleOutput tkConsolePrompt tkConsoleSource tkDarken tk_dialog tkEntryAutoScan tkEntryBackspace tkEntryButton1 tkEntryClosestGap tkEntryGetSelection tkEntryInsert tkEntryKeySelect tkEntryMouseSelect tkEntryNextWord tkEntryPaste tkEntryPreviousWord tkEntrySeeInsert tkEntrySetCursor tkEntryTranspose tkerror tkEventMotifBindings tkFDGetFileTypes tkFirstMenu tk_focusFollowsMouse tkFocusGroup_BindIn tkFocusGroup_BindOut tkFocusGroup_Create tkFocusGroup_Destroy tkFocusGroup_In tkFocusGroup_Out tk_focusNext tkFocusOK tk_focusPrev tkGenerateMenuSelect tk_getOpenFile tk_getSaveFile tkIconList tkIconList_Add tkIconList_Arrange tkIconList_AutoScan tkIconList_Btn1 tkIconList_Config tkIconList_Create tkIconList_CtrlBtn1 tkIconList_Curselection tkIconList_DeleteAll tkIconList_Double1 tkIconList_DrawSelection tkIconList_FocusIn tkIconList_FocusOut tkIconList_Get tkIconList_Goto tkIconList_Index tkIconList_Invoke tkIconList_KeyPress tkIconList_Leave1 tkIconList_LeftRight tkIconList_Motion1 tkIconList_Reset tkIconList_ReturnKey tkIconList_See tkIconList_Select tkIconList_Selection tkIconList_ShiftBtn1 tkIconList_UpDown tkListbox tkListboxAutoScan tkListboxBeginExtend tkListboxBeginSelect tkListboxBeginToggle tkListboxCancel tkListboxDataExtend tkListboxExtendUpDown tkListboxKeyAccel_Goto tkListboxKeyAccel_Key tkListboxKeyAccel_Reset tkListboxKeyAccel_Set tkListboxKeyAccel_Unset tkListboxMotion tkListboxSelectAll tkListboxUpDown tkMbButtonUp tkMbEnter tkMbLeave tkMbMotion tkMbPost tkMenuButtonDown tkMenuDownArrow tkMenuDup tkMenuEscape tkMenuFind tkMenuFindName tkMenuFirstEntry tkMenuInvoke tkMenuLeave tkMenuLeftArrow tkMenuMotion tkMenuNextEntry tkMenuNextMenu tkMenuRightArrow tk_menuSetFocus tkMenuUnpost tkMenuUpArrow tk_messageBox tkMessageBox tkMotifFDialog tkMotifFDialog_ActivateDList tkMotifFDialog_ActivateFEnt tkMotifFDialog_ActivateFList tkMotifFDialog_ActivateSEnt tkMotifFDialog_BrowseDList tkMotifFDialog_BrowseFList tkMotifFDialog_BuildUI tkMotifFDialog_CancelCmd tkMotifFDialog_Config tkMotifFDialog_Create tkMotifFDialog_FileTypes tkMotifFDialog_FilterCmd tkMotifFDialog_InterpFilter tkMotifFDialog_LoadFiles tkMotifFDialog_MakeSList tkMotifFDialog_OkCmd tkMotifFDialog_SetFilter tkMotifFDialog_SetListMode tkMotifFDialog_Update tk_optionMenu tk_popup tkPostOverPoint tkRecolorTree tkRestoreOldGrab tkSaveGrabInfo tkScaleActivate tkScaleButton2Down tkScaleButtonDown tkScaleControlPress tkScaleDrag tkScaleEndDrag tkScaleIncrement tkScreenChanged tkScrollButton2Down tkScrollButtonDown tkScrollButtonDrag tkScrollButtonUp tkScrollByPages tkScrollByUnits tkScrollDrag tkScrollEndDrag tkScrollSelect tkScrollStartDrag tkScrollTopBottom tkScrollToPos tk_setPalette tkTabToWindow tkTearOffMenu tkTextAutoScan tkTextButton1 tkTextClosestGap tk_textCopy tk_textCut tkTextInsert tkTextKeyExtend tkTextKeySelect tkTextNextPara tkTextNextPos tkTextNextWord tk_textPaste tkTextPaste tkTextPrevPara tkTextPrevPos tkTextPrevWord tkTextResetAnchor tkTextScrollPages tkTextSelectTo tkTextSetCursor tkTextTranspose tkTextUpDownLine tkTraverseToMenu tkTraverseWithinMenu tkvars tkwait toplevel ttk::button ttk::checkbutton ttk::combobox ttk::entry ttk::frame ttk::image ttk::intro ttk::label ttk::labelframe ttk::menubutton ttk::notebook ttk::panedwindow ttk::progressbar ttk::radiobutton ttk::scale ttk::scrollbar ttk::separator ttk::sizegrip ttk::spinbox ttk::style ttk::treeview ttk::widget ttk_vsapi
expand=

[settings]
# default extension used when saving files
#extension=tcl

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=tclsh "%f"
run_cmd=tclsh "%f"


ERRREEEEE

@@geany_file_contents[:sql] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
commentdoc=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
word=0xff6600;0x000000;true;false
word2=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;true;false
identifier=0xffffff;0x000000;false;false
sqlplus=0xffffff;0x000000;false;false
sqlplus_prompt=0xffffff;0x000000;false;false
sqlplus_comment=0xffffff;0x000000;false;false
quotedidentifier=0xffffff;0x000000;false;false

[keywords]
# all items must be in one line
keywords=absolute action add admin after aggregate alias all allocate alter and any are array as asc assertion at authorization before begin bfile bigint binary bit blob bool boolean both breadth by call cascade cascaded case cast catalog char character check class clob close cluster collate collation column commit completion connect connection constraint constraints constructor continue corresponding create cross cube current current_date current_path current_role current_time current_timestamp current_user cursor cycle data date day deallocate dec decimal declare default deferrable deferred delete depth deref desc describe descriptor destroy destructor deterministic diagnostics dictionary dimension disconnect diskgroup distinct domain double drop dynamic each else end end-exec equals escape every except exception exec execute exists explain external false fetch first fixed flashback float for foreign found from free full function general get global go goto grant group grouping having host hour identity if ignore immediate in index indextype indicator initialize initially inner inout input insert int integer intersect interval into is isolation iterate join key language large last lateral leading left less level like limit local localtime localtimestamp locator long map match materialized mediumblob mediumint mediumtext merge middleint minus minute modifies modify module month names national natural nchar nclob new next no noaudit none not null numeric nvarchar2 object of off old on only open operation option or order ordinality out outer output package pad parameter parameters partial path postfix precision prefix preorder prepare preserve primary prior privileges procedure profile public purge read reads real recursive ref references referencing regexp regexp_like relative rename restrict result return returning returns revoke right role rollback rollup routine row rows savepoint schema scroll scope search second section select sequence session session_user set sets size smallint some space specific specifictype sql sqlexception sqlstate sqlwarning start state statement static structure synonym system_user table tablespace temporary terminate than then time timestamp timezone_hour timezone_minute tinyint to trailing transaction translation  treat trigger true truncate type under union unique unknown unnest update usage user using value values varchar varchar2 variable varying view when whenever where with without work write year zone


[settings]
# default extension used when saving files
#extension=sql

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=/*
comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:sh] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
operator=0xedf8f9;0x000000;false;false
identifier=0xffffff;0x000000;false;false
backticks=0x000000;0xcccc33;false;false
param=0x9933cc;0x000000;false;false
scalar=0xffffff;0x000000;false;false
error=0xff0000;0x000000;false;false
here_delim=0xff6600;0xff0000;false;false
here_q=0x99cc99;0x0000ff;false;false

[keywords]
primary=break case continue do done elif else esac eval exit export fi for function goto if in integer return set shift then until while


[settings]
# default extension used when saving files
#extension=sh

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start a column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
run_cmd="./%f"

ERRREEEEE
@@geany_file_contents[:ruby] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
word=0xff6600;0x000000;true;false
global=0xffcc00;0x000000;false;false
symbol=0x339999;0x000000;false;false
classname=0xffffff;0x000000;true;false
defname=0xffcc00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
modulename=0xedf8f9;0x000000;true;false
backticks=0x000000;0xcccc33;false;false
instancevar=0xffffff;0x000000;false;true
classvar=0xffffff;0x000000;true;true
heredelim=0xff6600;0xff0000;false;false
worddemoted=0xffffff;0x000000;false;false
stdin=0xffffff;0x000000;false;false
stdout=0xffffff;0x000000;false;false
stderr=0xffffff;0x000000;false;false
datasection=0x600000;0xfff0d8;false;false
regex=0x44b4cc;0x000000;false;false
here_q=0x99cc99;0x0000ff;false;false
here_qq=0x99cc99;0x0000ff;true;false
here_qx=0x99cc99;0x0000ff;false;true
string_q=0x66ff00;0x000000;false;false
string_qq=0x66ff00;0x000000;false;false
string_qx=0x66ff00;0x000000;false;false
string_qr=0x66ff00;0x000000;false;false
string_qw=0x66ff00;0x000000;false;false
upper_bound=0xffffff;0x000000;false;false
error=0xffffff;0x000000;false;false
pod=0x772cb7;0x070707;false;false

[keywords]
# all items must be in one line
primary=__FILE__ load define_method attr_accessor attr_writer attr_reader and def end in or self unless __LINE__ begin defined? ensure module redo super until BEGIN break do false next rescue then when END case else for nil include require retry true while alias class elsif if not return undef yield


[settings]
# default extension used when saving files
#extension=rb

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=ruby -c "%f"
run_cmd=ruby "%f"

ERRREEEEE
@@geany_file_contents[:restructuredtext] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[settings]
# default extension used when saving files
#extension=rst

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
#comment_open=#
#comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
#comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE

@@geany_file_contents[:README] = <<-ERRREEEEE
Copy files from /usr/share/geany/ to this directory to overwrite them. To use the defaults, just delete the file in this directory.
For more information read the documentation (in /usr/share/doc/geany/html/index.html or visit http://www.geany.org/).
ERRREEEEE
@@geany_file_contents[:r] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
# primary keyword
kword=0xff6600;0x000000;false;false
operator=0xffcc00;0x000000;false;false
# package keyword
basekword=0xff8000;0x000000;false;false
# package_other keyword
otherkword=0xff8000;0x000000;false;false
number=0xff8000;0x000000;false;false
# "blah" string
string=0x66ff00;0x000000;false;false
# 'blah' string
string2=0x66ff00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
infix=0x66ff00;0x000000;false;false
infixeol=0xffffff;0x000000;false;false

[keywords]
# all items must be in one line
primary=abs array break data.frame diag else FALSE for function if in Inf matrix NA NaN NCOL next NROW NULL print read.table repeat require return solve source sqrt sum TRUE while
package=abbreviate abline abs acf acos acosh addmargins aggregate agrep alarm alias alist all anova any aov aperm append apply approx approxfun apropos ar args arima array arrows asin asinh assign assocplot atan atanh attach attr attributes autoload autoloader ave axis backsolve barplot basename beta bindtextdomain binomial biplot bitmap bmp body box boxplot bquote break browser builtins bxp by bzfile c call cancor capabilities casefold cat category cbind ccf ceiling character charmatch chartr chol choose chull citation class close cm cmdscale codes coef coefficients col colnames colors colorspaces colours comment complex confint conflicts contour contrasts contributors convolve cophenetic coplot cor cos cosh cov covratio cpgram crossprod cummax cummin cumprod cumsum curve cut cutree cycle data dataentry date dbeta dbinom dcauchy dchisq de debug debugger decompose delay deltat demo dendrapply density deparse deriv det detach determinant deviance dexp df dfbeta dfbetas dffits dgamma dgeom dget dhyper diag diff diffinv difftime digamma dim dimnames dir dirname dist dlnorm dlogis dmultinom dnbinom dnorm dotchart double dpois dput drop dsignrank dt dump dunif duplicated dweibull dwilcox eapply ecdf edit effects eigen emacs embed end environment eval evalq example exists exp expression factanal factor factorial family fft fifo file filter find fitted fivenum fix floor flush for force formals format formula forwardsolve fourfoldplot frame frequency ftable function gamma gaussian gc gcinfo gctorture get getenv geterrmessage gettext gettextf getwd gl glm globalenv gray grep grey grid gsub gzcon gzfile hat hatvalues hcl hclust head heatmap help hist history hsv httpclient iconv iconvlist identical identify if ifelse image influence inherits integer integrate interaction interactive intersect invisible isoreg jitter jpeg julian kappa kernapply kernel kmeans knots kronecker ksmooth labels lag lapply layout lbeta lchoose lcm legend length letters levels lfactorial lgamma library licence license line lines list lm load loadhistory loadings local locator loess log logb logical loglin lowess ls lsfit machine mad mahalanobis makepredictcall manova mapply match matlines matplot matpoints matrix max mean median medpolish menu merge message methods mget min missing mode monthplot months mosaicplot mtext mvfft names napredict naprint naresid nargs nchar ncol next nextn ngettext nlevels nlm nls noquote nrow numeric objects offset open optim optimise optimize options order ordered outer pacf page pairlist pairs palette par parse paste pbeta pbinom pbirthday pcauchy pchisq pdf pentagamma person persp pexp pf pgamma pgeom phyper pi pico pictex pie piechart pipe plclust plnorm plogis plot pmatch pmax pmin pnbinom png pnorm points poisson poly polygon polym polyroot postscript power ppoints ppois ppr prcomp predict preplot pretty princomp print prmatrix prod profile profiler proj promax prompt provide psigamma psignrank pt ptukey punif pweibull pwilcox q qbeta qbinom qbirthday qcauchy qchisq qexp qf qgamma qgeom qhyper qlnorm qlogis qnbinom qnorm qpois qqline qqnorm qqplot qr qsignrank qt qtukey quantile quarters quasi quasibinomial quasipoisson quit qunif quote qweibull qwilcox rainbow range rank raw rbeta rbind rbinom rcauchy rchisq readline real recover rect reformulate regexpr relevel remove reorder rep repeat replace replicate replications require reshape resid residuals restart return rev rexp rf rgamma rgb rgeom rhyper rle rlnorm rlogis rm rmultinom rnbinom rnorm round row rownames rowsum rpois rsignrank rstandard rstudent rt rug runif runmed rweibull rwilcox sample sapply save savehistory scale scan screen screeplot sd search searchpaths seek segments seq sequence serialize setdiff setequal setwd shell sign signif sin single sinh sink smooth solve sort source spectrum spline splinefun split sprintf sqrt stack stars start stderr stdin stdout stem step stepfun stl stop stopifnot str strftime strheight stripchart strptime strsplit strtrim structure strwidth strwrap sub subset substitute substr substring sum summary sunflowerplot supsmu svd sweep switch symbols symnum system t table tabulate tail tan tanh tapply tempdir tempfile termplot terms tetragamma text time title toeplitz tolower topenv toupper trace traceback transform trigamma trunc truncate try ts tsdiag tsp typeof unclass undebug union unique uniroot unix unlink unlist unname unserialize unsplit unstack untrace unz update upgrade url var varimax vcov vector version vi vignette warning warnings weekdays weights which while window windows with write wsbrowser xedit xemacs xfig xinch xor xtabs xyinch yinch zapsmall
package_other=acme aids aircondit amis aml banking barchart barley beaver bigcity boot brambles breslow bs bwplot calcium cane capability cav censboot channing city claridge cloth cloud coal condense contourplot control corr darwin densityplot dogs dotplot ducks empinf envelope environmental ethanol fir frets gpar grav gravity grob hirose histogram islay knn larrows levelplot llines logit lpoints lsegments lset ltext lvqinit lvqtest manaus melanoma melanoma motor multiedit neuro nitrofen nodal ns nuclear oneway parallel paulsen poisons polar qq qqmath remission rfs saddle salinity shingle simplex singer somgrid splom stripplot survival tau tmd tsboot tuna unit urine viewport wireframe wool xyplot

[settings]
# default extension used when saving files
#extension=R

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
   #command_example();
# setting to false would generate this
#  command_example();
# This setting works only for single line comments
comment_use_indent=false

# context action command (please see Geany's main documentation for details)
context_action_cmd=


ERRREEEEE
@@geany_file_contents[:python] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
word=0xff6600;0x000000;true;false
triple=0xff8000;0x000000;false;false
tripledouble=0xffffff;0x000000;false;false
classname=0xffffff;0x000000;false;false
defname=0xff00ff;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
commentblock=0x9933cc;0x000000;false;false
stringeol=0xffff00;0x000000;false;false
word2=0xffffff;0x000000;true;false
decorator=0x808000;0x000000;false;false

[keywords]
# all items must be in one line
primary=and as assert break class continue def del elif else except exec finally for from global if import in is lambda not or pass print raise return try while with yield False None True
# additional keywords, will be highlighted with style "word2"
identifiers=


[settings]
# default extension used when saving files
#extension=py

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=python -c "import py_compile; py_compile.compile('%f')"
run_cmd=python "%f"

ERRREEEEE
@@geany_file_contents[:po] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xff8000;0x000000;false;false
comment=0x9933cc;0x000000;false;false
msgid=0xff6600;0x000000;true;false
msgid_text=0xff6600;0x000000;false;false
msgstr=0xff8000;0x000000;true;false
msgstr_text=0xff8000;0x000000;false;false
msgctxt=0xff8000;0x000000;true;false
msgctxt_text=0xff8000;0x000000;false;false
#fuzzy=0xffa500;0x000000;true;false
fuzzy=0xffffff;0x000000;true;false

# the lexer don't support keywords


[settings]
# default extension used when saving files
#extension=po

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=msgfmt --check --check-accelerators=_ "%f"


ERRREEEEE
@@geany_file_contents[:php] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# styling for PHP/HTML is done in filetypes.xml


[settings]
# default extension used when saving files
#extension=php

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
# these comments are used for PHP, the comments used in HTML are in filetypes.xml
comment_open=/*
comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=php -l "%f"
run_cmd=php "%f"

# use can also use something like this, to view your PHP or HTML files through a browser and webserver
#run_cmd=firefox http://localhost/test_site/%f

ERRREEEEE

@@geany_file_contents[:perl] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0x99cc99;0x000000;false;false
error=0xff80c0;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
preprocessor=0xedf8f9;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
scalar=0xffffff;0x000000;false;false
pod=0xffffff;0x000000;false;true
regex=0x44b4cc;0x000000;false;false
array=0xffffff;0x000000;false;false
hash=0xffffff;0x000000;false;false
symboltable=0x99cc99;0x000000;false;false
backticks=0x000000;0xcccc33;false;false
pod_verbatim=0xffffff;0x000000;false;false
reg_subst=0x999966;0xffeeec;false;false
datasection=0x66ff00;0x000000;false;false
here_delim=0xff6600;0xff0000;false;false
here_q=0x99cc99;0x0000ff;false;false
here_qq=0x99cc99;0x0000ff;true;false
here_qx=0x99cc99;0x0000ff;false;true
string_q=0x66ff00;0x000000;false;false
string_qq=0x66ff00;0x000000;false;false
string_qx=0x66ff00;0x000000;false;false
string_qr=0x66ff00;0x000000;false;false
string_qw=0x66ff00;0x000000;false;false
variable_indexer=0xffffff;0x000000;false;false
# not used
punctuation=0xedf8f9;0x000000;false;false
# obsolete: replaced by qq, qx, qr, qw
longquote=0xff8000;0x000000;false;false
sub_prototype=0xffcc00;0x000000;false;true
format_ident=0xc000c0;0x000000;true;false
format=0xc000c0;0x000000;false;false

[keywords]
primary=NULL __FILE__ __LINE__ __PACKAGE__ __DATA__ __END__ AUTOLOAD BEGIN CORE DESTROY END EQ GE GT INIT LE LT NE CHECK abs accept alarm and atan2 bind binmode bless caller chdir chmod chomp chop chown chr chroot close closedir cmp connect continue cos crypt dbmclose dbmopen defined delete die do dump each else elsif endgrent endhostent endnetent endprotoent endpwent endservent eof eq eval exec exists exit exp fcntl fileno flock for foreach fork format formline ge getc getgrent getgrgid getgrnam gethostbyaddr gethostbyname gethostent getlogin getnetbyaddr getnetbyname getnetent getpeername getpgrp getppid getpriority getprotobyname getprotobynumber getprotoent getpwent getpwnam getpwuid getservbyname getservbyport getservent getsockname getsockopt glob gmtime goto grep gt hex if index int ioctl join keys kill last lc lcfirst le length link listen local localtime lock log lstat lt m map mkdir msgctl msgget msgrcv msgsnd my ne next no not oct open opendir or ord our pack package pipe pop pos print printf prototype push q qq qr quotemeta qu qw qx rand read readdir readline readlink readpipe recv redo ref rename require reset return reverse rewinddir rindex rmdir s scalar seek seekdir select semctl semget semop send setgrent sethostent setnetent setpgrp setpriority setprotoent setpwent setservent setsockopt shift shmctl shmget shmread shmwrite shutdown sin sleep socket socketpair sort splice split sprintf sqrt srand stat study sub substr symlink syscall sysopen sysread sysseek system syswrite tell telldir tie tied time times tr truncate uc ucfirst umask undef unless unlink unpack unshift untie until use utime values vec wait waitpid wantarray warn while write x xor y


[settings]
# default extension used when saving files
#extension=pl

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)

# B - The Perl Bytecode Compiler (requires Perl 5.8 or higher)
compiler=perl -MO=Bytecode,-H,-o"%f"c "%f"

# alternatively use perlcc
#compiler=perlcc -o "%e" "%f"

# instead of actual compiling, just run a nice syntax check
#compiler=perl -c "%f"

run_cmd=perl "%f"

ERRREEEEE
@@geany_file_contents[:pascal] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0x66ff00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
comment2=0x9933cc;0x707070;false;false
commentline=0x9933cc;0x000000;false;false
preprocessor=0xedf8f9;0x000000;false;false
preprocessor2=0xedf8f9;0x000000;false;false
number=0xff8000;0x000000;false;false
hexnumber=0xff8000;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
stringeol=0xffff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
asm=0x804080;0x000000;false;false


[keywords]
# all items must be in one line
primary=absolute abstract add and array as asm assembler automated begin byte case cdecl char class const constructor contains default deprecated destructor dispid dispinterface div do downto dynamic else end except export exports external far file final finalization finally for forward function goto if implementation implements in index inherited initialization inline integer interface is label library message mod name near nil nodefault not object of on or out overload override package packed pascal platform private procedure program property protected public published raise read readonly real record register reintroduce remove repeat requires resourcestring safecall sealed set shl shr static stdcall stored strict string then threadvar to try type unit unsafe until uses var varargs virtual while with word write writeonly xor


[settings]
# default extension used when saving files
#extension=pas

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open={
comment_close=}

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=fpc "%f"
run_cmd="./%e"

ERRREEEEE
@@geany_file_contents[:nsis] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false;
comment=0x9933cc;0x000000;false;false;
stringdq=0x66ff00;0xeeeeee;false;false;
stringlq=0xffff80;0xc0c0c0;false;false;
stringrq=0xffffff;0xc0c0c0;false;false;
function=0xff6600;0x000000;false;false;
variable=0xff8000;0x000000;false;false;
label=0x99cc99;0xffff80;false;false;
userdefined=0xfdffec;0xff80ff;true;false;
sectiondef=0xff6600;0x000000;true;false;
subsectiondef=0xff6600;0x000000;true;false;
ifdefinedef=0x808040;0x000000;true;false;
macrodef=0x800000;0x000000;true;false;
stringvar=0xff8000;0x000000;false;false;
number=0x99cc99;0x000000;false;false;
sectiongroup=0xff6600;0x000000;true;false;
pageex=0xff6600;0x000000;true;false;
functiondef=0xff6600;0x000000;true;false;
commentbox=0x9933cc;0x000000;false;false;


[keywords]
# all items must be in one line and in lowercase
functions=abort addbrandingimage !addincludedir !addincludedirdir !addplugindir addsize addsizesize_to_add_to_section_in_kb allowrootdirinstall allowskipfiles !appendfile autoclosewindow bgfont bggradient brandingtext bringtofront call callinstdll caption captioninstaller_caption !cd changeui checkbitmap clearerrors completedtext componenttext contributors: copyfiles crccheck createdirectory createdirectorydirectory_name createfont createshortcut !define delete deleteinisec deleteinistr deleteregkey deleteregvalue !delfilefile detailprint detailprintmessage detailsbuttontext dirshow dirtext dirvar dirverify dirverifyauto !echo !echomessage !else enablewindow !endif enumregkey enumregvalue !error exch exec execshell !execute execwait expandenvstrings file filebufsize fileclose fileerrortext fileopen fileread filereadbyte fileseek filewrite filewritebyte findclose findfirst findnext findwindow flushini function functionend function_name getcurinsttype getcurrentaddress getcurrentaddressoutput getdlgitem getdllversion getdllversionlocal geterrorlevel getfiletime getfiletimelocal getfullpathname getfunctionaddress getinstdirerror getlabeladdress gettempfilename goto gotolabel hidewindow icon !if ifabort !ifdef iferrors iffileexists !ifmacrodef !ifmacrondef !ifndef ifrebootflag ifsilent !include initpluginsdir !insertmacro installbuttontext installcolors installdir installdirregkey instprogressflags insttype insttypegettext insttypesettext intcmp intcmpu intfmt intop iswindow langstring langstringup licensebkcolor licensedata licenseforceselection licenselangstring licensetext loadlanguagefile lockwindow logset logtext !macro !macroend makensis messagebox miscbuttontext name none nop outfile !packhdr page pagecallbacks pageex pageexend pop portions push pushstring quit readenvstr readinistr readregdword readregstr reboot regdll rename requestexecutionlevel reservefile return rmdir !searchparse searchpath !searchreplace section sectionend sectiongetflags sectiongetinsttypes sectiongetsize sectiongettext sectiongroup sectiongroupend sectionin sectionsetflags sectionsetinsttypes sectionsetsize sectionsettext sendmessage setautoclose setbrandingimage setcompress setcompressionlevel setcompressor setcompressordictsize setctlcolors setcurinsttype setdatablockoptimize setdatesave setdetailsprint setdetailsview seterrorlevel seterrors setfileattributes setfont setoutpath setoverwrite setpluginunload setrebootflag setregview setshellvarcontext setsilent showinstdetails showuninstdetails showwindow silentinstall silentuninstall sleep spacetexts strcmp strcmps strcpy strlen subcaption subsection subsectionend !system !tempfilesymbol !undef uninstallbuttontext uninstallcaption uninstallexename uninstallicon uninstallsubcaption uninstalltext uninstpage unregdll var !verbose viaddversionkey viproductversion !warning windowicon writeinistr writeregbin writeregdword writeregexpandstr writeregstr writeuninstaller xpstyle
variables=$$ $` $' $" $0 $0, $1 $2 $3 $4 $5 $6 $7 $8 $9 $admintools $appdata $cdburn_area $cmdline $commonfiles $cookies $desktop $documents $exedir $favorites $fonts $history $hwndparent $instdir $internet_cache $language $music $nethood ${nsisdir} $outdir $pictures $pluginsdir $printhood $profile $programfiles $quicklaunch $\r $r0 $r1 $r2 $r3 $r4 $r5 $r6 $r7 $r8 $r9 $recent $resources $resources_localized $sendto $smprograms $smstartup $startmenu $sysdir $temp $templates $varname $videos $windir
lables=all alt alwaysoff archive auto both bottom bzip2 center colored components control current custom directory dlg_id ext false file_attribute_archive file_attribute_hidden file_attribute_normal file_attribute_offline file_attribute_readonly file_attribute_system file_attribute_temporary filesonly force hidden hide hkcc hkcr hkcu hkdd hkey_classes_root hkey_current_config hkey_current_user hkey_dyn_data hkey_local_machine hkey_performance_data hkey_users hklm hkpd hku idabort idcancel idignore idno idok idretry idyes ifdiff ifnewer instfiles italic  lastused leave left license listonly lzma manual mb_abortretryignore mb_defbutton1 mb_defbutton2 mb_defbutton3 mb_defbutton4 mb_iconexclamation mb_iconinformation mb_iconquestion mb_iconstop mb_ok mb_okcancel mb_retrycancel mb_right mb_setforeground mb_topmost mb_yesno mb_yesnocancel nevershow none nonfatal normal of off offline on open print readonly rebootok right shctx shift show silent silentlog smooth strike sw_hide  sw_showmaximized sw_showmaximized  sw_showminimized sw_showminimized  sw_showminnoactive  sw_showna  sw_shownoactivate  sw_shownormal sw_shownormal  system temporary textonly top trim true try underline  uninstconfirm zlib
userdefined=


[settings]
# default extension used when saving files
#extension=nsi

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=;
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=makensis "%f"
run_cmd="./%e"

ERRREEEEE
@@geany_file_contents[:matlab] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
command=0x66ff00;0x000000;true;false
number=0xff8000;0x000000;false;false
keyword=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
doublequotedstring=0x66ff00;0x000000;false;false

[keywords]
# all items must be in one line
primary=break case catch continue else elseif end for function global if otherwise persistent return switch try while

[settings]
# default extension used when saving files
#extension=m

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=%
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run_cmd=octave -q "%f"

ERRREEEEE
@@geany_file_contents[:makefile] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
preprocessor=0xffff00;0x000000;false;false
identifier=0xff6600;0x000000;false;false
operator=0xffffff;0x000000;false;false
target=0x99cc99;0x000000;false;false
ideol=0xffffff;0x000000;false;false

# there are no keywords available otherwise mail me


[settings]
# default extension used when saving files
#extension=mak

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE

@@geany_file_contents[:lua] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
commentdoc=0x9933cc;0x000000;true;false
number=0xff8000;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
literalstring=0x95004a;0x000000;false;false
preprocessor=0xedf8f9;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
stringeol=stringeol
function_basic=0x0080c0;0x000000;false;false
function_other=0x66ff00;0x000000;false;false
coroutines=0x0000a0;0x000000;false;false
word5=0xff6600;0x000000;false;false
word6=0xff6600;0x000000;false;false
word7=0xff6600;0x000000;false;false
word8=0xff6600;0x000000;false;false

[keywords]
# all items must be in one line
keywords=and break do else elseif end false for function if in local nil not or repeat return then true until while
# Basic functions
function_basic=_ALERT assert call collectgarbage coroutine debug dofile dostring error _ERRORMESSAGE foreach foreachi _G gcinfo getfenv getmetatable getn globals _INPUT io ipairs load loadfile loadlib loadstring math module newtype next os _OUTPUT pairs pcall print _PROMPT rawequal rawget rawset require select setfenv setmetatable sort _STDERR _STDIN _STDOUT string table tinsert tonumber tostring tremove type unpack _VERSION xpcall
# String, (table) & math functions
function_other=abs acos asin atan atan2 ceil cos deg exp floor format frexp gsub ldexp log log10 math.abs math.acos math.asin math.atan math.atan2 math.ceil math.cos math.cosh math.deg math.exp math.floor math.fmod math.frexp math.huge math.ldexp math.log math.log10 math.max math.min math.mod math.modf math.pi math.pow math.rad math.random math.randomseed math.sin math.sinh math.sqrt math.tan math.tanh max min mod rad random randomseed sin sqrt strbyte strchar strfind string.byte string.char string.dump string.find string.format string.gfind string.gmatch string.gsub string.len string.lower string.match string.rep string.reverse string.sub string.upper strlen strlower strrep strsub strupper table.concat table.foreach table.foreachi table.getn table.insert table.maxn table.remove table.setn table.sort tan
# (coroutines), I/O & system facilities
coroutines=appendto clock closefile coroutine.create coroutine.resume coroutine.running coroutine.status coroutine.wrap coroutine.yield date difftime execute exit flush getenv io.close io.flush io.input io.lines io.open io.output io.popen io.read io.stderr io.stdin io.stdout io.tmpfile io.type io.write openfile os.clock os.date os.difftime os.execute os.exit os.getenv os.remove os.rename os.setlocale os.time os.tmpname package.cpath package.loaded package.loadlib package.path package.preload package.seeall read readfrom remove rename seek setlocale time tmpfile tmpname write writeto
# user definable keywords
user1=
user2=
user3=
user4=

[settings]
# default extension used when saving files
#extension=lua

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=--
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=--[[
#comment_close=]]--

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run_cmd=lua "%f"


ERRREEEEE
@@geany_file_contents[:latex] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
command=0x66ff00;0x000000;true;false
tag=0xedf8f9;0x000000;true;false
math=0xff6600;0x000000;false;false
comment=0xff8000;0x000000;false;true

[keywords]
# all items must be in one line
primary=above abovedisplayshortskip abovedisplayskip abovewithdelims accent adjdemerits advance afterassignment aftergroup atop atopwithdelims badness baselineskip batchmode begin begingroup belowdisplayshortskip belowdisplayskip binoppenalty botmark box boxmaxdepth brokenpenalty catcode char chardef cleaders closein closeout clubpenalty copy count countdef cr crcr csname day deadcycles def defaulthyphenchar defaultskewchar delcode delimeters delimiter delimiterfactor delimitershortfall dimen dimendef discretionary displayindent displaylimits displaystyle displaywidowpenalty displaywidth divide doublehyphendemerits dp dump edef else emergencystretch end endcsname endgroup endinput endlinechar eqno errhelp errmessage errorcontextlines errorstopmode escapechar everycr everydisplay everyhbox everyjob everymath everypar everyvbox exhyphenpenalty expandafter fam fi finalhyphendemerits firstmark floatingpenalty font fontdimen fontname futurelet gdef global globaldefs group halign hangafter hangindent hbadness hbox hfil hfill hfilneg hfuzz hoffset holdinginserts horizontal hrule hsize hskip hss ht hyphen hyphenation hyphenchar hyphenpenalty if ifcase ifcat ifdim ifeof iffalse ifhbox ifhmode ifinner ifmmode ifnum ifodd iftrue ifvbox ifvmode ifvoid ifx ignorespaces immediate indent input inputlineno insert insertpenalties interlinepenalty jobname kern language lastbox lastkern lastpenalty lastskip lccode leaders left lefthyphenmin leftskip leqno let limits line linepenalty lineskip lineskiplimit long looseness lower lowercase mag mark mathaccent mathbin mathchar mathchardef mathchoice mathclose mathcode mathinner mathop mathopen mathord mathpunct mathrel mathsurround maxdeadcycles maxdepth meaning medmuskip message mkern month moveleft moveright mskip multiply muskip muskipdef newlinechar noalign noboundary noexpand noindent nolimits nonscript nonstopmode nulldelimiterspace nullfont number omit openin openout or outer output outputpenalty over overfullrule overline overwithdelims pagedepth pagefilllstretch pagefillstretch pagefilstretch pagegoal pageshrink pagestretch pagetotal par parfillskip parindent parshape parskip patterns pausing penalty postdisplaypenalty predisplaypenalty predisplaysize pretolerance prevdepth prevgraf radical raise read relax relpenalty right righthyphenmin rightskip romannumeral scriptfont scriptscript scriptscriptfont scriptscriptstyle scriptspace scriptstyle scrollmode setbox setlanguage sfcode shipout show showbox showboxbreadth showboxdepth showlists showthe skewchar skip skipdef spacefactor spaceskip span special splitbotmark splitfirstmark splitmaxdepth splittopskip string subsection tabskip textfont textstyle the thickmuskip thinmuskip time toks toksdef tolerance topmark topskip tracingcommands tracinglostchars tracingmacros tracingonline tracingoutput tracingpages tracingparagraphs tracingrestores tracingstats uccode uchyph underline unhbox unhcopy unkern unpenalty unskip unvbox unvcopy uppercase vadjust valign vbadness vbox vcenter vfil vfill vfilneg vfuzz voffset vrule vsize vskip vsplit vss vtop wd widowpenalty write xdef xleaders xspaceskip year


[settings]
# default extension used when saving files
#extension=tex

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=%
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=latex --file-line-error-style "%f"
# it is called linker, but here it is an alternative compiler command
linker=pdflatex --file-line-error-style "%f"
run_cmd=xdvi "%f"
run_cmd2=xpdf "%f"

ERRREEEEE
@@geany_file_contents[:javascript] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=ffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
# all items must be in one line
primary=abs abstract acos anchor asin atan atan2 big bold boolean break byte case catch ceil char charAt charCodeAt class concat const continue cos Date debugger default delete do double else enum escape eval exp export extends false final finally fixed float floor fontcolor fontsize for fromCharCode function goto if implements import in indexOf Infinity instanceof int interface isFinite isNaN italics join lastIndexOf length link log long Math max MAX_VALUE min MIN_VALUE NaN native NEGATIVE_INFINITY new null Number package parseFloat parseInt pop POSITIVE_INFINITY pow private protected public push random return reverse round shift short sin slice small sort splice split sqrt static strike string String sub substr substring sup super switch synchronized tan this throw throws toLowerCase toString toUpperCase transient true try typeof undefined unescape unshift valueOf var void volatile while with

[settings]
# default extension used when saving files
#extension=js

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run=



ERRREEEEE
@@geany_file_contents[:java] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0xffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
primary=abstract assert break case catch class const continue default do else extends final finally for future generic goto if implements import inner instanceof interface native new outer package private protected public rest return static super switch synchronized this throw throws transient try var volatile while true false null
secondary=boolean byte char double float int long null short void
# documentation keywords for javadoc
doccomment=author deprecated exception param return see serial serialData serialField since throws todo version
typedefs=


[settings]
# default extension used when saving files
#extension=java

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=/*
comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=javac "%f"
run_cmd=java "%e"

ERRREEEEE
@@geany_file_contents[:html] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
html_default=0xffffff;0x1E1E1E;false;false
html_tag=0x7392CF;0x1E1E1E;true;false
html_tagunknown=0xffffff;0x8C0101;true;false
html_attribute=0xCDA0D5;0x1E1E1E;false;false
html_attributeunknown=0xffffff;0x8C0101;false;false
html_number=0x800080;0x1E1E1E;false;false
html_doublestring=0xA8E498;0x1E1E1E;false;false
html_singlestring=0xA8E498;0x1E1E1E;false;false
html_other=0xffffff;0x1E1E1E;false;false
html_comment=0x747474;0x1E1E1E;false;false
html_entity=0xFFA95C;0x2C2821;false;false
html_tagend=0x7392CF;0x1E1E1E;true;false
# <?
html_xmlstart=0x000099;0xf0f0f0;false;false
# ?>
html_xmlend=0xffffff;0x1E1E1E;false;false
# <script
html_script=0xffffff;0x1E1E1E;false;false
# <% ... %>
html_asp=0xffffff;0x1E1E1E;false;false
# <%@ ... %>
html_aspat=0xffffff;0x1E1E1E;false;false
html_cdata=0xffffff;0x1E1E1E;false;false
html_question=0xffffff;0x1E1E1E;false;false
html_value=0xffffff;0x1E1E1E;false;false
html_xccomment=0xffffff;0x1E1E1E;false;false

sgml_default=0xffffff;0x4C1700;false;false
sgml_comment=0x747474;0x4C1700;false;false
sgml_special=0xffffff;0x4C1700;false;false
sgml_command=0xfffffff;0x4C1700;true;false
sgml_doublestring=0xA8E498;0x4C1700;false;false
sgml_simplestring=0xA8E498;0x4C1700;false;false
sgml_1st_param=0xffffff;0x4C1700;false;false
sgml_entity=0xFFA95C;0x4C1700;false;false
sgml_block_default=0xffffff;0x4C1700;false;false
sgml_1st_param_comment=0xffffff;0x4C1700;false;false
sgml_error=0xff0000;0x4C1700;false;false

php_default=0xffffff;0x1E1E1E;false;false
php_simplestring=0xA18651;0x1E1E1E;false;false
php_hstring=0xA18651;0x1E1E1E;false;false
php_number=0x7ECDFF;0x1E1E1E;false;false
php_word=0xFFCB4F;0x1E1E1E;true;false
php_variable=0xffffff;0x1E1E1E;false;false
php_comment=0x747474;0x1E1E1E;false;false
php_commentline=0x747474;0x1E1E1E;false;false
php_operator=0x98BAC5;0x1E1E1E;false;false
php_hstring_variable=0xffffff;0x1E1E1E;false;false
php_complex_variable=0xffffff;0x1E1E1E;false;false

jscript_start=0x008080;0x1E1E1E;false;false
jscript_default=0xffffff;0x1E1E1E;false;false
#jscript_comment=0x222222;0x1E1E1E;false;false
#jscript_commentline=0x808080;0x1E1E1E;false;false
#jscript_commentdoc=0x3f5fbf;0x1E1E1E;false;false
#jscript_number=0x006060;0x1E1E1E;false;false
#jscript_word=0x0000ff;0x1E1E1E;false;false
#jscript_keyword=0x501000;0x1E1E1E;false;false
jscript_doublestring=0xff901e;0x1E1E1E;false;false
jscript_singlestring=0xff901e;0x1E1E1E;false;false
#jscript_symbols=0x001050;0x1E1E1E;false;false
#jscript_stringeol=0x000000;0x1E1E1E;false;false

jscript_comment=0x747474;0x1E1E1E;false;false
jscript_commentline=0x747474;0x1E1E1E;false;false
jscript_commentdoc=0x747474;0x1E1E1E;false;false
jscript_number=0x7ECDFF;0x1E1E1E;false;false
jscript_word=0xFFCB4F;0x1E1E1E;false;false
jscript_keyword=0xAAFF57;0x1E1E1E;true;false
jscript_symbols=0x98BAC5;0x1E1E1E;true;false
jscript_stringeol=0xffffff;0xffffff;true;false


[keywords]
html=a abbr acronym address applet area b base basefont bdo big blockquote body br button caption center cite code col colgroup dd del dfn dir div dl dt em embed fieldset font form frame frameset h1 h2 h3 h4 h5 h6 head hr html i iframe img input ins isindex kbd label legend li link map menu meta noframes noscript object ol optgroup option p param pre q quality s samp script select small span strike strong style sub sup table tbody td textarea tfoot th thead title tr tt u ul var xmlns leftmargin topmargin abbr accept-charset accept accesskey action align alink alt archive axis background bgcolor border cellpadding cellspacing char charoff charset checked cite class classid clear codebase codetype color cols colspan compact content coords data datafld dataformatas datapagesize datasrc datetime declare defer dir disabled enctype face for frame frameborder selected headers height href hreflang hspace http-equiv id ismap label lang language link longdesc marginwidth marginheight maxlength media framespacing method multiple name nohref noresize noshade nowrap object onblur onchange onclick ondblclick onfocus onkeydown onkeypress onkeyup onload onmousedown onmousemove onmouseover onmouseout onmouseup onreset onselect onsubmit onunload profile prompt pluginspage readonly rel rev rows rowspan rules scheme scope scrolling shape size span src standby start style summary tabindex target text title type usemap valign value valuetype version vlink vspace width text password checkbox radio submit reset file hidden image public doctype xml
javascript=break this for while null else var false void new delete typeof if in continue true function with return case super extends do const try debugger catch switch finally enum export default class throw import length concat join pop push reverse shift slice splice sort unshift Date Infinity NaN undefined escape eval isFinite isNaN Number parseFloat parseInt string unescape Math abs acos asin atan atan2 ceil cos exp floor log max min pow random round sin sqrt tan MAX_VALUE MIN_VALUE NEGATIVE_INFINITY POSITIVE_INFINITY toString valueOf String length anchor big bold charAt charCodeAt concat fixed fontcolor fontsize fromCharCode indexOf italics lastIndexOf link slice small split strike sub substr substring sup toLowerCase toUpperCase
vbscript=and as byref byval case call const continue dim do each else elseif end error exit false for function global goto if in loop me new next not nothing on optional or private public redim rem resume select set sub then to true type while with boolean byte currency date double integer long object single string type variant
python=and assert break class continue complex def del elif else except exec finally for from global if import in inherit is int lambda not or pass print raise return tuple try unicode while yield long float str list
php=and or xor FILE exception LINE array as break case class const continue declare default die do echo else elseif empty  enddeclare endfor endforeach endif endswitch endwhile eval exit extends for foreach function global if include include_once  isset list new print require require_once return static switch unset use var while FUNCTION CLASS METHOD final php_user_filter interface implements extends public private protected abstract clone try catch throw cfunction old_function this
sgml=ELEMENT DOCTYPE ATTLIST ENTITY NOTATION


[settings]
# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=<!--
comment_close=-->

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
        #command_example();
# setting to false would generate this
#       command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=


ERRREEEEE
@@geany_file_contents[:haskell] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
commentblock=0x9933cc;0x000000;false;false
commentblock2=0x9933cc;0x000000;false;false
commentblock3=0x9933cc;0x000000;false;false
number=0x800080;0x000000;false;false
keyword=0xff6600;0x000000;true;false
import=0xffffff;0x000000;false;false
string=0xca6500;0x000000;false;false
character=0xca6500;0x000000;false;false
class=0xffffff;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
instance=0xffffff;0x000000;false;false
capital=0xffffff;0x000000;false;false
module=0xffffff;0x000000;false;false
data=0xffffff;0x000000;false;false

[keywords]
# all items must be in one line
keywords=as case class data deriving do else if import in infixl infixr instance let module of primitive qualified then type where


[settings]
# default extension used when saving files
#extension=hs

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=--
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=ghc --make "%f"
run_cmd="./%e"

ERRREEEEE
@@geany_file_contents[:haxe] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0xffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
# all items must be in one line
primary=abstract break case catch class const continue trace do else enum extends finally for function goto if implements import in instanceof int interface new package private public return static super switch this throw throws transient try typeof var void volatile while with
secondary=Bool Float Int null Void Enum String
classes=Array ArrayAccess Class Date DateTools EReg Hash IntHash IntIter Iterable Iterator Lambda List Math Null Protected Reflect Std StringBuf StringTools Type UInt ValueType Xml XmlType


[settings]
# default extension used when saving files
#extension=hx

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=haxe -neko "%e.n" -cp . "%f"
run_cmd=neko "%e"



ERRREEEEE
@@geany_file_contents[:glsl] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0xffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type
# whether arguments of preprocessor commands should be styled (only first argument is used)
# 1 to enable, 0 to disable
styling_within_preprocessor=1;0;false;false

[keywords]
# all items must be in one line
primary=if else switch case default for while do discard return break continue true false struct void bool int uint float vec2 vec3 vec4 ivec2 ivec3 ivec4 bvec2 bvec3 bvec4 uvec2 uvec3 uvec4 mat2 mat3 mat4 mat2x2 mat2x3 mat2x4 mat3x2 mat3x3 mat3x4 mat4x2 mat4x3 mat4x4 sampler1D sampler2D sampler3D samplerCube sampler1DShadow sampler2DShadow sampler1DArray sampler2DArray sampler1DArrayShadow sampler2DArrayShadow isampler1D isampler2D isampler3D isamplerCube isampler1DArray isampler2DArray usampler1D usampler2D usampler3D usamplerCube usampler1DArray usampler2DArray const invariant centroid in out inout attribute uniform varying smooth flat noperspective highp mediump lowp
secondary=
# these are some doxygen keywords (incomplete)
docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return returns see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=glsl

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
#compiler=
#linker=
#run_cmd=



ERRREEEEE
@@geany_file_contents[:freebasic] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false;
comment=0x9933cc;0x000000;false;false;
number=0x99cc99;0x000000;false;false;
word=0xff6600;0x000000;true;false;
string=0x66ff00;0x000000;false;false;
preprocessor=0x99cc99;0x000000;false;false;
operator=0xffffff;0x000000;false;false;
identifier=0xffffff;0x000000;false;false;
date=0x00ff00;0x000000;false;false;
stringeol=0xffff00;0x000000;false;false;
word2=0xff6600;0x000000;true;false;
word3=0xff6600;0x000000;false;false;
word4=0xff6600;0x000000;false;false;
constant=0xedf8f9;0x000000;false;false;
# asm is still unused
asm=0xffffff;0x000000;false;false;
label=0xedf8f9;0x000000;false;false;
error=0xff80c0;0x000000;false;false;
hexnumber=0xff8000;0x000000;false;false;
binnumber=0xff8000;0x000000;false;false;

[keywords]
# all items must be in one line
keywords=abs access acos alias allocate alpha and any append as assert assertwarn asc asin asm atan2 atn base beep bin binary bit bitreset bitset bload bsave byref byte byval call callocate case cast cbyte cdbl cdecl chain chdir chr cint circle class clear clng clngint close cls color com cons command common condbroadcast condcreate conddestroy condsignal condwait const constructor continue cos cptr cshort csign csng csrlin cubyte cuint culng culngint cunsg curdir cushort custom cvd cvi cvl cvlongint cvs cvshort data date dateadd datediff datepart dateserial datevalue day deallocate declare defbyte defdbl defint deflng deflngint defshort defsng defstr defubyte defuint defulngint defushort delete destructor dim dir do double draw dynamic dylibfree dylibload dylibsymbol else elseif encoding end enum environ escape eof eqv erase erfn erl ermn err error exec exepath exit exp explicit export extern false fboolean field fileattr filecopy filedatetime fileexists filelen fix flip for format frac fre freefile function get getjoystick getkey getmouse gosub goto  hex hibyte hiword hour  if iif imageconvertrow imagecreate imagedestroy imp import inkey inp input input$ instr int integer is isdate  kill  lbound lcase left len let lib lpt line lobyte loc local locate lock lof log long longint loop loword lpos lprint lset ltrim mid minute mkd mkdir mki mkl mklongint mks mkshort mod month monthname multikey mutexcreate mutexdestroy mutexlock mutexunlock name namespace nokeyword next new not now oct offsetof on once open option operator or out output overload paint palette pascal pcopy peek pipe pmap point pointer poke pos preserve preset print private procptr property protected pset ptr public put random randomize read reallocate redim rem reset restore resume return rgb rgba right rmdir rnd rset rtrim run sadd scope scrn screen screencopy screencontrol screenevent screeninfo screenglproc screenlist screenlock screenptr screenres screenset screensync screenunlock second seek select setdate setenviron setmouse settime sgn shared shell short sin single sizeof sleep space spc sqr static stdcall step stop str string strptr sub swap system shr shl tab tan then this threadcreate threadwait time timeserial timevalue timer to trans trim true type ubound ubyte ucase uinteger ulong ulongint union unlock unsigned until ushort using va_arg va_first va_next val vallng valint valuint valulng var varptr view wait wbin wchr weekday weekdayname wend while whex width window windowtitle winput with woct write wspace wstr wstring xor year zstring
preprocessor=#define defined typeof #dynamic #else #endif #error #if #ifdef #ifndef #inclib #include #print #static #undef #macro #endmacro #elseif #libpath #pragma
# user definable keywords
user1=
user2=

[settings]
# default extension used when saving files
#extension=bas

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open='
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/'
#comment_close='/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=fbc -w all "%f"
run_cmd="./%e"


ERRREEEEE
@@geany_file_contents[:fortran] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
string2=0x66ff00;0x000000;true;false
word=0xff6600;0x000000;true;false
word2=0xff6600;0x000000;true;false
word3=0xff6600;0x000000;true;false
preprocessor=0x800000;0x000000;false;false
operator2=0x66ff00;0x000000;true;false
continuation=0x9933cc;0x000000;false;false
#continuation=0x66ff00;0xf0e080;false;false
stringeol=0x808040;0x000000;false;false
label=0xffffff;0xff80ff;true;false


[keywords]
# all items must be in one line
primary=access action advance allocatable allocate apostrophe assign assignment associate asynchronous backspace bind blank blockdata call case character class close common complex contains continue cycle data deallocate decimal delim default dimension direct do dowhile double doubleprecision elemental else elseif elsewhere encoding end endassociate endblockdata enddo endfile endforall endfunction endif endinterface endmodule endprogram endselect endsubroutine endtype endwhere entry eor equivalence err errmsg exist exit extends external file flush fmt forall form format formatted function go goto id if implicit in include inout integer inquire intent interface intrinsic iomsg iolength iostat kind len logical module name named namelist nextrec nml none nullify number only open opened operator optional out pad parameter pass pause pending pointer pos position precision print private procedure program protected public quote pure read readwrite real rec recl recursive result return rewind save select selectcase selecttype sequential sign size stat status stop stream subroutine target then to type unformatted unit use value volatile wait where while write
intrinsic_functions=abs achar acos acosd adjustl adjustr aimag aimax0 aimin0 aint ajmax0 ajmin0 akmax0 akmin0 all allocated alog alog10 amax0 amax1 amin0 amin1 amod anint any asin asind associated atan atan2 atan2d atand bitest bitl bitlr bitrl bjtest bit_size bktest break btest cabs ccos cdabs cdcos cdexp cdlog cdsin cdsqrt ceiling cexp char clog cmplx conjg cos cosd cosh count cpu_time cshift csin csqrt dabs dacos dacosd dasin dasind datan datan2 datan2d datand date date_and_time dble dcmplx dconjg dcos dcosd dcosh dcotan ddim dexp dfloat dflotk dfloti dflotj digits dim dimag dint dlog dlog10 dmax1 dmin1 dmod dnint dot_product dprod dreal dsign dsin dsind dsinh dsqrt dtan dtand dtanh eoshift epsilon errsns exp exponent float floati floatj floatk floor fraction free huge iabs iachar iand ibclr ibits ibset ichar idate idim idint idnint ieor ifix iiabs iiand iibclr iibits iibset iidim iidint iidnnt iieor iifix iint iior iiqint iiqnnt iishft iishftc iisign ilen imax0 imax1 imin0 imin1 imod index inint inot int int1 int2 int4 int8 iqint iqnint ior ishft ishftc isign isnan izext jiand jibclr jibits jibset jidim jidint jidnnt jieor jifix jint jior jiqint jiqnnt jishft jishftc jisign jmax0 jmax1 jmin0 jmin1 jmod jnint jnot jzext kiabs kiand kibclr kibits kibset kidim kidint kidnnt kieor kifix kind kint kior kishft kishftc kisign kmax0 kmax1 kmin0 kmin1 kmod knint knot kzext lbound leadz len len_trim lenlge lge lgt lle llt log log10 logical lshift malloc matmul max max0 max1 maxexponent maxloc maxval merge min min0 min1 minexponent minloc minval mod modulo mvbits nearest nint not nworkers number_of_processors pack popcnt poppar precision present product radix random random_number random_seed range real repeat reshape rrspacing rshift scale scan secnds selected_int_kind selected_real_kind set_exponent shape sign sin sind sinh size sizeof sngl snglq spacing spread sqrt sum system_clock tan tand tanh tiny transfer transpose trim ubound unpack verify
user_functions=cdabs cdcos cdexp cdlog cdsin cdsqrt cotan cotand dcmplx dconjg dcotan dcotand decode dimag dll_export dll_import doublecomplex dreal dvchk encode find flen flush getarg getcharqq getcl getdat getenv gettim hfix ibchng identifier imag int1 int2 int4 intc intrup invalop iostat_msg isha ishc ishl jfix lacfar locking locnear map nargs nbreak ndperr ndpexc offset ovefl peekcharqq precfill prompt qabs qacos qacosd qasin qasind qatan qatand qatan2 qcmplx qconjg qcos qcosd qcosh qdim qexp qext qextd qfloat qimag qlog qlog10 qmax1 qmin1 qmod qreal qsign qsin qsind qsinh qsqrt qtan qtand qtanh ran rand randu rewrite segment setdat settim system timer undfl unlock union val virtual volatile zabs zcos zexp zlog zsin zsqrt


[settings]
# default extension used when saving files
#extension=f90

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=!
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=false

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=gfortran -Wall -c "%f"
linker=gfortran -Wall -o "%e" "%f"
run_cmd="./%e"


ERRREEEEE
@@geany_file_contents[:ferite] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0xffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
# all items must be in one line
primary=false null self super true abstract alias and arguments attribute_missing break case class closure conformsToProtocol constructor continue default deliver destructor diliver directive do else extends eval final fix for function global handle if iferr implements include instanceof isa method_missing modifies monitor namespace new or private protected protocol public raise recipient rename return static switch uses using while
types=boolean string number array object void XML Unix Sys String Stream Serialize RMI Posix Number Network Math FileSystem Console Array Regexp XSLT
docComment=brief class declaration description end example extends function group implements modifies module namespace param protocol return return static type variable warning

[settings]
# default extension used when saving files
#extension=fe

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=ferite -vc "%f"
run_cmd=ferite "%f"

ERRREEEEE
@@geany_file_contents[:f77] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
string2=0x66ff00;0x000000;true;false
word=0xff6600;0x000000;true;false
word2=0xff6600;0x000000;true;false
word3=0xff6600;0x000000;true;false
preprocessor=0x800000;0x000000;false;false
operator2=0x66ff00;0x000000;true;false
continuation=0x9933cc;0x000000;false;false
#continuation=0x66ff00;0xf0e080;false;false
stringeol=0x808040;0x000000;false;false
label=0xffffff;0xff80ff;true;false


[keywords]
# all items must be in one line
primary=access action advance allocatable allocate apostrophe assign assignment associate asynchronous backspace bind blank blockdata call case character class close common complex contains continue cycle data deallocate decimal delim default dimension direct do dowhile double doubleprecision else elseif elsewhere encoding end endassociate endblockdata enddo endfile endforall endfunction endif endinterface endmodule endprogram endselect endsubroutine endtype endwhere entry eor equivalence err errmsg exist exit external file flush fmt form format formatted function go goto id if implicit in include inout integer inquire intent interface intrinsic iomsg iolength iostat kind len logical module name named namelist nextrec nml none nullify number only open opened operator optional out pad parameter pass pause pending pointer pos position precision print private program protected public quote read readwrite real rec recl recursive result return rewind save select selectcase selecttype sequential sign size stat status stop stream subroutine target then to type unformatted unit use value volatile wait where while write
intrinsic_functions=abs achar acos acosd adjustl adjustr aimag aimax0 aimin0 aint ajmax0 ajmin0 akmax0 akmin0 all allocated alog alog10 amax0 amax1 amin0 amin1 amod anint any asin asind associated atan atan2 atan2d atand bitest bitl bitlr bitrl bjtest bit_size bktest break btest cabs ccos cdabs cdcos cdexp cdlog cdsin cdsqrt ceiling cexp char clog cmplx conjg cos cosd cosh count cpu_time cshift csin csqrt dabs dacos dacosd dasin dasind datan datan2 datan2d datand date date_and_time dble dcmplx dconjg dcos dcosd dcosh dcotan ddim dexp dfloat dflotk dfloti dflotj digits dim dimag dint dlog dlog10 dmax1 dmin1 dmod dnint dot_product dprod dreal dsign dsin dsind dsinh dsqrt dtan dtand dtanh eoshift epsilon errsns exp exponent float floati floatj floatk floor fraction free huge iabs iachar iand ibclr ibits ibset ichar idate idim idint idnint ieor ifix iiabs iiand iibclr iibits iibset iidim iidint iidnnt iieor iifix iint iior iiqint iiqnnt iishft iishftc iisign ilen imax0 imax1 imin0 imin1 imod index inint inot int int1 int2 int4 int8 iqint iqnint ior ishft ishftc isign isnan izext jiand jibclr jibits jibset jidim jidint jidnnt jieor jifix jint jior jiqint jiqnnt jishft jishftc jisign jmax0 jmax1 jmin0 jmin1 jmod jnint jnot jzext kiabs kiand kibclr kibits kibset kidim kidint kidnnt kieor kifix kind kint kior kishft kishftc kisign kmax0 kmax1 kmin0 kmin1 kmod knint knot kzext lbound leadz len len_trim lenlge lge lgt lle llt log log10 logical lshift malloc matmul max max0 max1 maxexponent maxloc maxval merge min min0 min1 minexponent minloc minval mod modulo mvbits nearest nint not nworkers number_of_processors pack popcnt poppar precision present product radix random random_number random_seed range real repeat reshape rrspacing rshift scale scan secnds selected_int_kind selected_real_kind set_exponent shape sign sin sind sinh size sizeof sngl snglq spacing spread sqrt sum system_clock tan tand tanh tiny transfer transpose trim ubound unpack verify
user_functions=cdabs cdcos cdexp cdlog cdsin cdsqrt cotan cotand dcmplx dconjg dcotan dcotand decode dimag dll_export dll_import doublecomplex dreal dvchk encode find flen flush getarg getcharqq getcl getdat getenv gettim hfix ibchng identifier imag int1 int2 int4 intc intrup invalop iostat_msg isha ishc ishl jfix lacfar locking locnear map nargs nbreak ndperr ndpexc offset ovefl peekcharqq precfill prompt qabs qacos qacosd qasin qasind qatan qatand qatan2 qcmplx qconjg qcos qcosd qcosh qdim qexp qext qextd qfloat qimag qlog qlog10 qmax1 qmin1 qmod qreal qsign qsin qsind qsinh qsqrt qtan qtand qtanh ran rand randu rewrite segment setdat settim system timer undfl unlock union val virtual volatile zabs zcos zexp zlog zsin zsqrt


[settings]
# default extension used when saving files
#extension=f

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=c
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=false

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=gfortran -Wall -c "%f"
linker=gfortran -Wall -o "%e" "%f"
run_cmd="./%e"


ERRREEEEE

@@geany_file_contents[:docbook] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
tag=0xff6600;0x000000;false;false
tagunknown=0xff6600;0x000000;false;false
attribute=0x99cc99;0x000000;false;false
attributeunknown=0xffffff;0x000000;false;false
number=0x99cc99;0x000000;false;false
doublestring=0x66ff00;0x000000;false;false
singlestring=0x66ff00;0x000000;false;false
other=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
entity=0xffffff;0x000000;false;false
tagend=0xff6600;0x000000;false;false
xmlstart=0x99cc99;0x000000;false;false
xmlend=0x99cc99;0x000000;false;false
cdata=0xffcc00;0x000000;false;false
question=0x99cc99;0x000000;false;false
value=0xff8000;0x000000;false;false
xccomment=0xffffff;0x000000;false;false
sgml_default=0xffffff;0x707070;false;false
sgml_comment=0x9933cc;0x707070;false;false
sgml_special=0xff8000;0x707070;false;false
sgml_command=0xff6600;0x707070;true;false
sgml_doublestring=0x66ff00;0x707070;false;false
sgml_simplestring=0x66ff00;0x707070;false;false
sgml_1st_param=0x99cc99;0x707070;false;false
sgml_entity=0xffffff;0x707070;false;false
sgml_block_default=0xffffff;0x707070;false;false
sgml_1st_param_comment=0x9933cc;0x707070;false;false
sgml_error=0xff80c0;0x707070;false;false

[keywords]
# all items must be in one line
elements=abbrev abstract accel ackno acronym action address affiliation alt anchor answer appendix appendixinfo application area areaset areaspec arg article articleinfo artpagenums attribution audiodata audioobject author authorblurb authorgroup authorinitials beginpage bibliocoverage bibliodiv biblioentry bibliography bibliographyinfo biblioid bibliomisc bibliomixed bibliomset bibliorelation biblioset bibliosource blockinfo blockquote book bookinfo bridgehead callout calloutlist caption caution chapter chapterinfo citation citebiblioid citerefentry citetitle city classname classsynopsis classsynopsisinfo cmdsynopsis co collab  cols colnum nameend namest align spanname colname collabname colophon colspec command computeroutput confdates confgroup confnum confsponsor conftitle constant constraint constraintdef constructorsynopsis contractnum contractsponsor contrib copyright coref corpauthor corpname country database date dedication destructorsynopsis edition editor email emphasis entry entrytbl envar epigraph equation errorcode errorname errortext errortype example exceptionname fax fieldsynopsis figure filename fileref firstname firstterm footnote footnoteref foreignphrase formalpara frame funcdef funcparams funcprototype funcsynopsis funcsynopsisinfo function glossary glossaryinfo glossdef glossdiv glossentry glosslist glosssee glossseealso glossterm graphic graphicco group guibutton guiicon guilabel guimenu guimenuitem guisubmenu hardware highlights holder honorific htm imagedata imageobject imageobjectco important index indexdiv indexentry indexinfo indexterm informalequation informalexample informalfigure informaltable initializer inlineequation inlinegraphic inlinemediaobject interface interfacename invpartnumber isbn issn issuenum itemizedlist itermset jobtitle keycap keycode keycombo keysym keyword keywordset label legalnotice lhs lineage lineannotation link listitem iteral literallayout lot lotentry manvolnum markup medialabel mediaobject mediaobjectco member menuchoice methodname methodparam methodsynopsis mm modespec modifier ousebutton msg msgaud msgentry msgexplan msginfo msglevel msgmain msgorig msgrel msgset msgsub msgtext nonterminal note objectinfo olink ooclass ooexception oointerface option optional orderedlist orgdiv orgname otheraddr othercredit othername pagenums para paramdef parameter part partinfo partintro personblurb personname phone phrase pob postcode preface prefaceinfo primary primaryie printhistory procedure production productionrecap productionset productname productnumber programlisting programlistingco prompt property pubdate publisher publishername pubsnumber qandadiv qandaentry qandaset question quote refclass refdescriptor refentry refentryinfo refentrytitle reference referenceinfo refmeta refmiscinfo refname refnamediv refpurpose refsect1 refsect1info refsect2 refsect2info refsect3 refsect3info refsection refsectioninfo refsynopsisdiv refsynopsisdivinfo releaseinfo remark replaceable returnvalue revdescription revhistory revision revnumber revremark rhs row sbr screen screenco screeninfo screenshot secondary secondaryie sect1 sect1info sect2 sect2info sect3 sect3info sect4 sect4info sect5 sect5info section sectioninfo see seealso seealsoie seeie seg seglistitem segmentedlist segtitle seriesvolnums set setindex setindexinfo setinfo sgmltag shortaffil shortcut sidebar sidebarinfo simpara simplelist simplemsgentry simplesect spanspec state step street structfield structname subject subjectset subjectterm subscript substeps subtitle superscript surname sv symbol synopfragment synopfragmentref synopsis systemitem table tbody term tertiary tertiaryie textdata textobject tfoot tgroup thead tip title titleabbrev toc tocback tocchap tocentry tocfront toclevel1 toclevel2 toclevel3 toclevel4 toclevel5 tocpart token trademark type ulink userinput varargs variablelist varlistentry varname videodata videoobject void volumenum warning wordasword xref year arch condition conformance id lang os remap role revision revisionflag security userlevel url vendor xreflabel status label endterm linkend space width
dtd=ELEMENT DOCTYPE ATTLIST ENTITY NOTATION


[settings]
# default extension used when saving files
#extension=docbook

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

ERRREEEEE
@@geany_file_contents[:diff] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
command=0xff6600;0x000000;false;false
header=0x66ff00;0x000000;false;false
position=0xff8000;0x000000;false;false
deleted=0x808040;0x000000;false;false
added=0x339999;0x000000;false;false
changed=0x99cc99;0x000000;false;false # not in np++


[settings]
# default extension used when saving files
#extension=diff

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# only the text before the first --- is a comment
comment_open=
comment_close=

# context action command (please see Geany's main documentation for details)
context_action_cmd=


ERRREEEEE

@@geany_file_contents[:d] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
commentdocnested=commentdoc
number=number
word=word
word2=word2
word3=word2
typedef=type
string=string
stringeol=stringeol
character=string
operator=operator
identifier=default
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc

[keywords]
# all items must be in one line
primary=__FILE__ __LINE__ __DATA__ __TIME__ __TIMESTAMP__ abstract alias align asm assert auto body bool break byte case cast catch cdouble cent cfloat char class const continue creal dchar debug default delegate delete deprecated do double else enum export extern false final finally float for foreach function goto idouble if ifloat import in inout int interface invariant ireal is long mixin module new null out override package pragma private protected public real return scope short static struct super switch synchronized template this throw true try typedef typeof ubyte ucent uint ulong union unittest ushort version void volatile wchar while with
secondary=
# documentation keywords for D, currently not working
docComment=Authors Bugs Copyright Date Deprecated Examples History License Macros Params Returns See_Also Standards Throws Version
types=

[settings]
# default extension used when saving files
#extension=d

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/
# this is alternative way, so multiline comments are used
#comment_open=/+
#comment_close=+/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=dmd -w -c "%f"
linker=dmd -w -of"%e" "%f"
# you can also use the gdc compiler, please use the "gdmd" wrapper script(included with gdc)
#compiler=gdmd -w -c "%f"
#linker=gdmd -w -of"%e" "%f"

run_cmd="./%e"



ERRREEEEE
@@geany_file_contents[:css] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
tag=0xff6600;0x000000;true;false
class=0x99cc99;0x000000;true;false
pseudoclass=0xff8000;0x000000;true;true
unknown_pseudoclass=0xff8080;0x000000;false;false
unknown_identifier=0xffffff;0x000000;false;false
operator=0xffffff;0x000000;false;false
identifier=0x999966;0x000000;true;false
doublestring=0x66ff00;0x000000;false;false
singlestring=0x66ff00;0x000000;false;false
attribute=0x99cc99;0x000000;false;false
value=0xffffff;0x000000;false;false
id=0x339999;0x000000;true;false
identifier2=0x996699;0x000000;true;false # not in np++
identifier2=0x999966;0x000000;true;false
important=0x99cc99;0x000000;true;false
directive=0x339999;0x000000;false;true
identifier3=0x669999;0x000000;true;false # not in np++
identifier2=0x999966;0x000000;true;false
pseudoelement=0xff8000;0x000000;true;true # not in np++
extended_identifier=0x99cc99;0x000000;true;false # not in np++
extended_pseudoclass=0xffcc00;0x000000;true;true # not in np++
extended_pseudoelement=0xffcc00;0x000000;true;true # not in np++

[keywords]
# CSS 1 properties
primary=background background-attachment background-color background-image background-position background-repeat border border-bottom border-bottom-width border-color border-left border-left-width border-right border-right-width border-style border-top border-top-width border-width clear color display float font font-family font-size font-style font-variant font-weight height letter-spacing line-height list-style list-style-image list-style-position list-style-type margin margin-bottom margin-left margin-right margin-top padding padding-bottom padding-left padding-right padding-top text-align text-decoration text-indent text-transform vertical-align white-space width word-spacing
# CSS 2 properties
secondary=azimuth border-bottom-color border-bottom-style border-collapse border-left-color border-left-style border-right-color border-right-style border-spacing border-top-color border-top-style bottom caption-side clip content counter-increment counter-reset cue cue-after cue-before cursor direction elevation empty-cells font-size-adjust font-stretch left max-height max-width min-height min-width orphans outline outline-color outline-style outline-width overflow page-break-after page-break-before page-break-inside pause pause-after pause-before pitch pitch-range play-during position quotes richness right speak speak-header speak-numeral speak-punctuation speech-rate stress table-layout top unicode-bidi visibility voice-family volume widows z-index
css3_properties=alignment-adjust alignment-baseline appearance ascent background-break background-clip background-origin background-size baseline baseline-shift bbox bookmark-label bookmark-level bookmark-target border-bottom-left-radius border-bottom-right-radius border-break border-image border-length border-radius border-top-left-radius border-top-right-radius box-align box-direction box-flex box-flex-group box-lines box-orient box-pack box-shadow box-sizing box-sizing cap-height centerline column-break-after column-break-before column-count column-fill column-gap column-rule column-rule-color column-rule-style column-rule-width columns column-span column-width crop definition-src descent dominant-baseline drop-initial-after-adjust drop-initial-after-align drop-initial-before-adjust drop-initial-before-align drop-initial-size drop-initial-value fit fit-position float-offset font-effect font-emphasize font-emphasize-position font-emphasize-style font-size-adjust font-smooth hanging-punctuation hyphenate-after hyphenate-before hyphenate-character hyphenate-lines hyphenate-resource hyphens icon image-orientation image-resolution inline-box-align line-stacking line-stacking-ruby line-stacking-shift line-stacking-strategy mark mark-after mark-before marks marquee-direction marquee-loop marquee-speed marquee-style mathline move-to nav-down nav-index nav-left nav-right nav-up opacity outline-offset overflow-style overflow-x overflow-y page page-policy panose-1 phonemes presentation-level punctuation-trim resize rest rest-after rest-before rotation rotation-point ruby-align ruby-overhang ruby-position ruby-span size slope src stemh stemv string-set tab-side target target-name target-new target-position text-align-last text-emphasis text-height text-indent text-justify text-outline text-replace text-shadow text-wrap topline unicode-range units-per-em voice-balance voice-duration voice-pitch voice-pitch-range voice-rate voice-stress voice-volume white-space-collapse widths word-break word-wrap x-height
pseudoclasses=active after before checked current disabled empty enabled first-child first-letter first-line first-of-type focus hover lang last-of-type link not nth-child nth-last-child nth-last-of-type nth-of-type only-child only-of-type root target visited
pseudo_elements=after before choices first-letter first-line line-marker marker outside repeat-index repeat-item selection slot value
browser_css_properties=
browser_pseudo_classes=
browser_pseudo_elements=


[settings]
# default extension used when saving files
#extension=css

# the following characters are these which a "word" can contains, see documentation
#wordchars=_-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=/*
comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:cs] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type
# whether arguments of preprocessor commands should be styled (only first argument is used)
# 1 to enable, 0 to disable
styling_within_preprocessor=1;0;false;false

[keywords]
# all items must be in one line
primary=abstract as base bool break byte case catch char checked class const continue decimal default delegate do double else enum event explicit extern false finally fixed float for foreach goto if implicit in int interface internal is lock long namespace new null object operator out override params private protected public readonly ref return sbyte sealed short sizeof stackalloc static string struct switch this throw true try typeof uint ulong unchecked unsafe ushort using virtual void volatile while
secondary=
# these are some doxygen keywords (incomplete)
docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=cs

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
# be careful following settings are untested
compiler=mcs /t:winexe "%f" /r:System,System.Drawing
run_cmd=mono "%e.exe"

ERRREEEEE
@@geany_file_contents[:cpp] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type
# whether arguments of preprocessor commands should be styled (only first argument is used)
# 1 to enable, 0 to disable
styling_within_preprocessor=1;0;false;false

[keywords]
# all items must be in one line
primary=and and_eq asm auto bitand bitor bool break case catch char class compl const const_cast continue default delete do double dynamic_cast else enum explicit export extern false float for friend goto if inline int long mutable namespace new not not_eq operator or or_eq private protected public register reinterpret_cast return short signed sizeof static static_cast struct switch template this throw true try typedef typeid typename union unsigned using virtual void volatile wchar_t while xor xor_eq
secondary=
# these are some doxygen keywords (incomplete)
docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=cpp

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=g++ -Wall -c "%f"
linker=g++ -Wall -o "%e" "%f"
run_cmd="./%e"


ERRREEEEE
@@geany_file_contents[:conf] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xca6500;0x000000;false;false
comment=0x9933cc;0x000000;false;false
section=0xffcc00;0x000000;true;false
key=0xff6600;0x000000;false;false
assignment=0xffffff;0x000000;false;false
defval=0xff6600;0x000000;false;false

# the lexer don't support keywords


[settings]
# default extension used when saving files
#extension=conf

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:common] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# use foreground;background;bold;italic or named_style,bold,italic

# used for filetype All/None
# default=default commented out since this breaks geany 0.16
default=0xffffff;0x000000;false;false

# 3rd selection argument is true to override default foreground
# 4th selection argument is true to override default background
selection=0x8000ff;0x404040;false;true

# style for a matching brace
brace_good=0x99cc99;0x000000;true;false
# style for a non-matching brace (a brace without a counterpart)
brace_bad=0xccff33;0x000000;true;false

# the following settings define the colours of the margins on the left side
margin_linenumber=0xe4e4e4;0x404040;false;false
margin_folding=0x222222;0x111111;false;false # 0x000000;0xdfdfdf

# background colour of the current line, only the second and third argument is interpreted
# use the third argument to enable or disable the highlighting of the current line (has to be true/false)
current_line=0x0080c0;0x333300;true;false

# translucency for the current line(first argument) and the selection (second argument)
# values between 0 and 256 are accepted. Note for Windows 95, 98 and ME users:
# keep this value at 256 to disable translucency otherwise Geany might crash
# only the first and second argument is interpreted
translucency=256;256;false;false

# style for a highlighted line (e.g when using Goto line or goto tag)
# only the first and second argument is interpreted
marker_line=0x00ffff;0x80d4b2;false;false

# style for a marked search results (when using "Mark" in Search dialogs)
# the second argument sets the background colour for the drawn rectangle
# only the second argument is interpreted
marker_search=0xffff00;0xff0000;false;false

# style for a marked line (e.g when using the "Toggle Marker" keybinding (Ctrl-M))
# only the first and second argument is interpreted
marker_mark=0xc00000;0x000000;false;false

# translucency for the line marker(first argument) and the search marker (second argument)
# only the first and second argument is interpreted
marker_translucency=256;256;false;false

# colour of the caret(the blinking cursor), only first and third argument is interpreted
# set the third argument to true to change the caret into a block caret
caret=0xffffff;0x112435;false;false

# width of the caret(the blinking cursor), only first argument is interpreted
# width in pixels, use 0 to make it invisible, maximum width is 3
caret_width=1;0;false;false

# set foreground and background colour of indentation guides
indent_guide=0xc0c0c0;;false;false

# third argument: if true, use this foreground color. If false, use the default value defined by the filetypes.
# fourth argument: if true, use this background color. If false, use the default value defined by the filetypes.
white_space=0xff8080;0x000000;true;false

# style of folding icons, only first and second arguments are used, valid values are:
# first argument:  1 for boxes, 2 for circles
# second argument: 1 for straight lines, 2 for curved lines
folding_style=1;1;false;false

# should an horizontal line be drawn at the line where text is folded (only first argument is interpreted)
# 0 to disable
# 1 to draw the line above folded text
# 2 to draw the line below folded text
folding_horiz_line=2;0;false;false

# only first argument is interpreted, sets whether all defined colours should be inverted
invert_all=0;0;false;false

# only first and second argument is interpreted
# first argument: drawing of visual flags to indicate a line is wrapped. This is a bitmask of the
# values: 0 - No visual flags, 1 - Visual flag at end of subline of a wrapped line, 2 - Visual flag
# at begin of subline of a wrapped line, Subline is indented by at least 1 to make room for the flag.
# second argument: wether the visual flags to indicate a line is wrapped are drawn near the border
# or near the text. This is a bitmask of the values: 0 - Visual flags drawn near border,
# 1 - Visual flag at end of subline drawn near text, 2 - Visual flag at begin of subline drawn near text
line_wrap_visuals=3;0;false;false

# only first and second argument is interpreted
# first argument: sets the size of indentation of sublines for wrapped lines in terms of
# the width of a space, only used when the second argument is 0
# second argument: wrapped sublines can be indented to the position of their first subline or
# one more indent level, possible values:
# 0 - Wrapped sublines aligned to left of window plus amount set by the first argument
# 1 - Wrapped sublines are aligned to first subline indent (use the same indentation)
# 2 - Wrapped sublines are aligned to first subline indent plus one more level of indentation
line_wrap_indent=0;1;false;false

# only first and second argument is interpreted
# first argument: amount of space to be drawn above the line's baseline
# second argument: amount of space to be drawn below the line's baseline
line_height=0;0;false;false

[settings]
# which characters should be skipped when moving (or included when deleting) to word boundaries
# should always include space and tab (\s\t)
whitespace_chars=\\s\\t!\\"\#\$\%&'()*+,-./:;<=>?@[\\\\]^`{|}~

[named_styles]
# style names to use in filetypes.* [styling] sections
# use foreground;background;bold;italic
# normally background should be left blank to use the "default" style

default=0xffffff;0x000000;false;false
comment=0x9933cc
commentdoc=0x772cb7;0x070707;false;false
number=0xccff33
# keyword
word=0xff6600;;true;false
# e.g. global types from a *.c.tags file
word2=0xdde93d;;true;false
string=0x66ff00
preprocessor=0xedf8f9
operator=0xffcc00
# unterminated string
stringeol=0xcccccc;0x000000;false;false
type=0xffffff;;true;false

ERRREEEEE
@@geany_file_contents[:conf] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xca6500;0x000000;false;false
comment=0x9933cc;0x000000;false;false
section=0xffcc00;0x000000;true;false
key=0xff6600;0x000000;false;false
assignment=0xffffff;0x000000;false;false
defval=0xff6600;0x000000;false;false

# the lexer don't support keywords


[settings]
# default extension used when saving files
#extension=conf

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:cmake] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false;
comment=0x9933cc;0x000000;false;false;
stringdq=0x66ff00;0x000000;false;false;
stringlq=0x66ff00;0x000000;false;false;
stringrq=0x66ff00;0x000000;false;false;
command=0xff6600;0x000000;false;false;
parameters=0x66ff00;0x000000;false;false;
variable=0xff8040;0x000000;false;false;
userdefined=0xffcc00;0x000000;true;false;
whiledef=0x339999;0x000000;true;false;
foreachdef=0x9933cc;0x000000;true;false;
ifdefinedef=0x66ff00;0x000000;true;false;
macrodef=0x99cc99;0x000000;true;false;
stringvar=0x66ff00;0x000000;false;false;
number=0x804040;0x000000;false;false;

[keywords]
# all items must be in one line
commands=add_custom_command add_custom_target add_definitions add_dependencies add_executable add_library add_subdirectory add_test aux_source_directory build_command build_name cmake_minimum_required configure_file create_test_sourcelist else elseif enable_language enable_testing endforeach endif endmacro endwhile exec_program execute_process export_library_dependencies file find_file find_library find_package find_path find_program fltk_wrap_ui foreach get_cmake_property get_directory_property get_filename_component get_source_file_property get_target_property get_test_property if include include_directories include_external_msproject include_regular_expression install install_files install_programs install_targets link_directories link_libraries list load_cache load_command macro make_directory mark_as_advanced math message option output_required_files project qt_wrap_cpp qt_wrap_ui remove remove_definitions separate_arguments set set_directory_properties set_source_files_properties set_target_properties set_tests_properties site_name source_group string subdir_depends subdirs target_link_libraries try_compile try_run use_mangled_mesa utility_source variable_requires vtk_make_instantiator vtk_wrap_java vtk_wrap_python vtk_wrap_tcl while write_file
parameters=ABSOLUTE ABSTRACT ADDITIONAL_MAKE_CLEAN_FILES ALL AND APPEND APPLE ARGS ASCII BEFORE BORLAND CACHE CACHE_VARIABLES CLEAR CMAKE_COMPILER_2005 COMMAND COMMAND_NAME COMMANDS COMMENT COMPARE COMPILE_FLAGS COPYONLY CYGWIN DEFINED DEFINE_SYMBOL DEPENDS DOC EQUAL ESCAPE_QUOTES EXCLUDE EXCLUDE_FROM_ALL EXISTS EXPORT_MACRO EXT EXTRA_INCLUDE FATAL_ERROR FILE FILES FORCE FUNCTION GENERATED GLOB GLOB_RECURSE GREATER GROUP_SIZE HEADER_FILE_ONLY HEADER_LOCATION IMMEDIATE INCLUDE_DIRECTORIES INCLUDE_INTERNALS INCLUDE_REGULAR_EXPRESSION INCLUDES LESS LINK_DIRECTORIES LINK_FLAGS LOCATION MACOSX_BUNDLE MACROS MAIN_DEPENDENCY MAKE_DIRECTORY MATCH MATCHALL MATCHES MINGW MODULE MSVC MSVC60 MSVC70 MSVC71 MSVC80 MSVC_IDE MSYS NAME NAME_WE NO_SYSTEM_PATH NOT NOTEQUAL OBJECT_DEPENDS OFF ON OPTIONAL OR OUTPUT OUTPUT_VARIABLE PATH PATHS POST_BUILD POST_INSTALL_SCRIPT PRE_BUILD PREFIX PRE_INSTALL_SCRIPT PRE_LINK PREORDER PROGRAM PROGRAM_ARGS PROPERTIES QUIET RANGE READ REGEX REGULAR_EXPRESSION REPLACE REQUIRED RETURN_VALUE RUNTIME_DIRECTORY SEND_ERROR SHARED SOURCES STATIC STATUS STREQUAL STRGREATER STRLESS SUFFIX TARGET TOLOWER TOUPPER VAR VARIABLES VERSION WATCOM WIN32 WRAP_EXCLUDE WRITE
userdefined=


[settings]
# default extension used when saving files
#extension=cmake

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

ERRREEEEE
@@geany_file_contents[:caml] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
comment1=0x9933cc;0x000000;false;false
comment2=0x9933cc;0x000000;false;false
comment3=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
keyword=0xff6600;0x000000;true;false
keyword2=0x66ff00;0x000000;true;false
string=0x66ff00;0x000000;false;false
char=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
tagname=0xffffff;0x000000;true;false
linenum=0xffffff;0x000000;false;false

[keywords]
# all items must be in one line
keywords=and as assert asr begin class constraint do done downto else end exception external false for fun function functor if in include inherit initializer land lazy let lor lsl lsr lxor match method mod module mutable new object of open or private rec sig struct then to true try type val virtual when while with
keywords_optional=option Some None ignore ref


[settings]
# default extension used when saving files
#extension=ml

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=(*
comment_close=*)

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=ocamlc -c "%f"
linker=ocamlc -o "%e" "%f"
run_cmd="./%e"

ERRREEEEE
@@geany_file_contents[:c] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0xffffff
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type
# whether arguments of preprocessor commands should be styled (only first argument is used)
# 1 to enable, 0 to disable
styling_within_preprocessor=1;0;false;false

[keywords]
# all items must be in one line
primary=asm auto break case char const continue default do double else enum extern float for goto if inline int long register return short signed sizeof static struct switch typedef union unsigned void volatile while FALSE NULL TRUE
secondary=
# these are some doxygen keywords (incomplete)
docComment=attention author brief bug class code date def enum example exception file fn namespace note param remarks return see since struct throw todo typedef var version warning union

[settings]
# default extension used when saving files
#extension=c

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=
# this is an alternative way, so multiline comments are used
#comment_open=/*
#comment_close=*/

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=gcc -Wall -c "%f"
linker=gcc -Wall -o "%e" "%f"
run_cmd="./%e"



ERRREEEEE
@@geany_file_contents[:asm] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=0x9933cc;0x000000;false;false
number=0xff8000;0x000000;false;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
cpuinstruction=0xff6600;0x000000;true;false
mathinstruction=0x0080c0;0x000000;true;false
register=0x8080ff;0xfffcc;true;false
directive=0x339999;0x000000;true;false
directiveoperand=0x66ff00;0x000000;false;false
commentblock=0x9933cc;0x000000;false;false
character=0x808000;0x000000;false;false
stringeol=0x66ff00;0x000000;false;false
extinstruction=0xedf8f9;0x000000;false;false

[keywords]
# all items must be in one line
# this is by default a very simple instruction set; not of Intel or so
instructions=hlt lad spi add sub mul div jmp jez jgz jlz swap jsr ret pushac popac addst subst mulst divst lsa lds push pop cli ldi ink lia dek ldx
registers=
directives=org list nolist page equivalent word text


[settings]
# default extension used when saving files
#extension=asm

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=;
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=nasm "%f"


ERRREEEEE
@@geany_file_contents[:ada] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
word=0xff6600;0x000000;true;false
identifier=0xffffff;0x000000;false;false
number=0xff8000;0x000000;false;false
delimiter=0xff8080;0x000000;false;false
character=0x66ff00;0x000000;false;false
charactereol=0x66ff00;0x000000;false;false
string=0x66ff00;0x000000;false;false
stringeol=0x66ff00;0x000000;false;false
label=0xedf8f9;0x000000;false;true
commentline=0xd9933cc;0x000000;false;false
illegal=0x99cc99;0x000000;false;true

[keywords]
# all items must be in one line
primary=abort abs abstract accept access aliased all and array at begin body case constant declare delay delta digits do else elsif end entry exception exit for function generic goto if in interface is limited loop mod new not null of or others out overriding package pragma private procedure protected raise range record rem renames requeue return reverse select separate subtype synchronized tagged task terminate then type until use when while with xor


[settings]
# default extension used when saving files
#extension=adb

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=


[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=gcc -Wall -c "%f"
linker=gnatmake "%e"
run_cmd="./%e"



ERRREEEEE
@@geany_file_contents[:actionscript] = <<-ERRREEEEE
# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
commentline=comment
commentdoc=commentdoc
number=number
word=word
word2=word2
string=string
character=string
uuid=0x404080
#uuid=0xffffff
preprocessor=preprocessor
operator=operator
identifier=default
stringeol=stringeol
# @"verbatim"
verbatim=0x66ff00
# (/regex/)
regex=0xffffff
commentlinedoc=commentdoc,bold
commentdockeyword=commentdoc,bold,italic
commentdockeyworderror=commentdoc
globalclass=type

[keywords]
# all items must be in one line
primary=arguments break case catch class const continue default do dynamic each else extends false final finally for function get if implements import in include Infinity interface internal label namespace NaN native new null override package private protected public return set static super switch this throw true try typeof undefined var while with
secondary=decodeURI decodeURIcomponent encodeURI encodeURIcomponent escape isFinite isNaN isXMLName parseFloat parseInt trace unescape
classes=ArgumentError Array Boolean Class Date DefinitionError Error EvalError Function int Math NameSpace Null Number Object QName RangeError ReferenceError RegExp SecurityError String SyntaxError TypeError uint URIError Vector VerifyError void XML XMLList

[settings]
# default extension used when saving files
#extension=as

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run_cmd=



ERRREEEEE




  end #class 
end #module
