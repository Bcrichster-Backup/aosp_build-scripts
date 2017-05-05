#!/bin/bash
# Copyright (C) 2016 DirtyUnicorns
# Copyright (C) 2016 Jacob McSwain
# Copyright (C) 2017 Eric Park (ideaman924)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Your source directory goes here
WORKING_DIR=/home/users/ideaman924/Bliss7.1/system

# The branch you want to checkout
BRANCH=n7.1

# This is the array of upstream repos we track
upstream=()

function get_repos() {
  declare -a repos=( $(repo list | cut -d: -f1) )
  for i in ${repos[@]}
  do
    upstream+=("$i")
  done
}

function checkout() {
  cd $WORKING_DIR/$1
  git checkout $BRANCH
}


# Start working
cd $WORKING_DIR

# Get the upstream repos we track
get_repos

# Checkout every repo in upstream
for i in ${upstream[@]}
do
  checkout $i
done
