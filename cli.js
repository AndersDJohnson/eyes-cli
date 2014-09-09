#!/usr/bin/env node

var coffee = require('coffee-script');
require('coffee-script/register');

var path = require('path');
var fs   = require('fs');

require('./src/command.coffee').run();
