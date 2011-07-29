#!/bin/bash

rm rmt_*
ruby test_generate_themes.rb
rm /home/gruen/.rvm/gems/ruby-1.8.7-p334/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/rmt_*
cp rmt*.tmTheme /home/gruen/.rvm/gems/ruby-1.8.7-p334/gems/redcar-0.11/plugins/textmate/vendor/redcar-bundles/Themes/
