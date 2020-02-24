#!/bin/zsh

# total article count header
printf "total_male_article_count," > results.csv
printf "total_female_article_count," >> results.csv

# total word count header
printf "total_male_word_count," >> results.csv
printf "total_female_word_count," >> results.csv

# male stats header
printf "disgust_word_count_male_absolute," >> results.csv
printf "disgust_word_count_male_percentage," >> results.csv

# female stats header
printf "disgust_word_count_female_absolute," >> results.csv
printf "disgust_word_count_female_percentage" >> results.csv

# end headers
echo "" >> results.csv

# total article count data
total_male_article_count=$(cat male_files.txt | wc -l)
total_female_article_count=$(cat female_files.txt | wc -l)
printf $total_male_article_count >> results.csv
printf "," >> results.csv
printf $total_female_article_count >> results.csv
printf "," >> results.csv

# total word count data
total_male_word_count=$(cat $(grep -v '^#' male_files.txt) | wc -w)
total_female_word_count=$(cat $(grep -v '^#' female_files.txt) | wc -w)
printf $total_male_word_count >> results.csv
printf "," >> results.csv
printf $total_female_word_count >> results.csv
printf "," >> results.csv

# male stats
disgust_word_count_male_absolute=$(cat $(grep -v '^#' male_files.txt) | grep -i -o "disgust" | wc -l)
disgust_word_count_male_percentage=$(bc -l <<< "$disgust_word_count_male_absolute / $total_male_word_count * 100")
printf $disgust_word_count_male_absolute >> results.csv
printf "," >> results.csv
printf $disgust_word_count_male_percentage >> results.csv
printf "," >> results.csv

# female stats
disgust_word_count_female_absolute=$(cat $(grep -v '^#' female_files.txt) | grep -i -o "disgust" | wc -l)
disgust_word_count_female_percentage=$(bc -l <<< "$disgust_word_count_female_absolute / $total_female_word_count * 100")
printf $disgust_word_count_female_absolute >> results.csv
printf "," >> results.csv
printf $disgust_word_count_female_percentage >> results.csv


