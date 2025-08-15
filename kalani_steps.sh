#!/usr/bin/env bash
if [[ -t 1 && "$TERM" != "dumb" ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    BOLD_GREEN='\033[1;32m'
    BOLD='\033[1m'
    GREY='\033[90m'
    BLUE='\033[34m'
    NC='\033[0m' # No Color
else
    RED=''
    GREEN=''
    BOLD=''
    GREY=''
    BLUE=''
    NC=''
fi

echo -e "${BLUE}Referencing Kalani Williams' tutorial at: ${BOLD}https://temporal-windscreen-639.notion.site/Github-Portfolio-Lesson-for-CM515-1e55bd019b2f80a7855feacaa46e4632${NC}"

read -r -d '' dont_need <<EOF
.editorconfig
.gitattributes
.github
docs
test
CHANGELOG.md
minimal-mistakes-jekyll.gemspec
README.md
screenshot-layouts.png
screenshot.png
EOF

echo -e "${BOLD_GREEN}Step 1. Remove the files/directories you don't need:${NC}"
echo -e "${GREY}$dont_need${NC}"

trashcan=${TMP:=/tmp}/kalani_$(date +"%Y-%m-%d-%H-%M-%S")
mkdir -p $trashcan
for path in $dont_need
do
    if [ -e $path ]
    then
        mv -v $path $trashcan
    fi
done


# the following is a rather large starter for _pages/home.md
read -r -d '' kalani_home_md <<EOF
---
layout: single
permalink: / 
     
hidden: true
header:
  #image: /assets/images/header.jpeg
  #overlay_color: #"#5e616c"
  #overlay_image: /assets/images/fog_road.jpeg
title: "  "
tagline: "  "   
author_profile: true
classes: wide
   
feature_row1:
  - image_path: path_to_your_image.png # no quotes this time
    alt: "Resources"
    excerpt: "Enter a relatively short description here"
    url: "/resources/" # note that these can also be full urls that take people to other sites
    btn_class: "btn--inverse" # feel free to change the button style!
    btn_label: "Whatever you want your button to say"
    
feature_row2:
  - image_path: path_to_your_image.png # no quotes this time
    alt: "Lectures"
    excerpt: "Enter a relatively short description here"
    url: "/lectures/" # note that these can also be full urls that take people to other sites
    btn_class: "btn--inverse" # feel free to change the button style!
    btn_label: "Whatever you want your button to say"
    
feature_row3:
  - image_path: path_to_your_image.png # no quotes this time
    alt: "Image Analysis Project"
    excerpt: "Enter a relatively short description here"
    url: "/image_analysis_project/" # note that these can also be full urls that take people to other sites
    btn_class: "btn--inverse" # feel free to change the button style!
    btn_label: "Whatever you want your button to say"

feature_row4:
  - image_path: path_to_your_image.png # no quotes this time
    alt: "ggplot Project"
    excerpt: "Enter a relatively short description here"
    url: "/gglplot_project/" # note that these can also be full urls that take people to other sites
    btn_class: "btn--inverse" # feel free to change the button style!
    btn_label: "Whatever you want your button to say" 
---

Portfolio of materials from [CSU CM515](https://github.com/Colorado-State-University-CMB/CM515-course-2025/tree/main)! 

# Resources

{% include feature_row id="feature_row1" type= "left" %}

# Lectures

{% include feature_row id="feature_row2" type= "left" %}

# Image Analysis Project

{% include feature_row id="feature_row3" type= "left" %}

# ggplot Project

{% include feature_row id="feature_row4" type= "left" %}
EOF

# place Kalani's starter in _pages/home.md
echo -e "${BOLD_GREEN}Step 2. CREATING home.md${NC}"
mkdir -p _pages
echo -e "$kalani_home_md" > _pages/home.md
cmd="head _pages/home.md"
echo -e \$ $cmd
echo -en "$GREY"
eval $cmd
echo -en "$NC"


echo -e "${BOLD}Next steps:${NC} follow Kalani\'s tutorial to edit _config.yml, _data/navigation.yml, and _pages/homd.md"

