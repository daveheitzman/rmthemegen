#!/bin/bash

rm rmt_*
ruby test_generate_themes.rb 10
#rm /home/gruen/.rvm/gems/ruby-1.8.7-p334/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/rmt_*
rm /home/gruen/.rvm/gems/ruby-1.8.7-p352/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/rmt_*
#cp rmt*.tmTheme /home/gruen/.rvm/gems/ruby-1.8.7-p334/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/
cp rmt*.tmTheme /home/gruen/.rvm/gems/ruby-1.8.7-p352/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/
