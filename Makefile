# Copyright Layer5, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include .github/build/Makefile.show-help.mk

setup-libs: 
	## "DEPRECATED: This target is deprecated. Use `make setup`.

## Install layer5.io dependencies your local machine.
setup:
	npm install --legacy-peer-deps

## Run layer5.io on your local machine.
site:
	npm start
	
## Run layer5.io on your local machine. Alternate method.
site-fast:
	gatsby develop

## Build layer5.io on your local machine.
build:
	gatsby build && gatsby serve

## Empty build cache and run layer5.io on your local machine.
clean: 
	gatsby clean && make site

## Run Eslint on your local machine.
lint:
	npm run lint

## Prepare a list of features for the pricing page.
features: 
	curl -L https://docs.google.com/spreadsheets/d/e/2PACX-1vQwzrUSKfuSRcpkp7sJTw1cSB63s4HCjYLJeGPWECsvqn222hjaaONQlN4X8auKvlaB0es3BqV5rQyz/pub\?gid\=1153419764\&single\=true\&output\=csv -o .github/build/spreadsheet.csv
	node .github/build/features-to-json.js .github/build/spreadsheet.csv src/sections/Pricing/feature_data.json
	rm .github/build/spreadsheet.csv

.PHONY: setup build site clean site-fast lint features
