# Shell-Script to clean up a (quite specific) tabular file ("2021-11-26-Article-list-dirty.tsv") and automatically extract the Journals' ISSNs and publication years. Results will be  written to the file "2021-11-26-Dates_and_ISSNs.tsv"
# Homework for module 4 of Zertifikatskurs Forschungsdatenmanagement 2021/2022
# Author: Johannes v. Vacano
# Date: 2021-12-12
# Tools used: Git Bash, Nano, Notepad++ (for comfort) and your friend and mine, the almighty internet, for everything else ...
echo "I will now clean your dirty data and find the stuff you need"
grep -P "\d{4}-\d{4}|\d{4}-\d{3}X" 2021-11-26-Article_list_dirty.tsv | sed -E 's/IMPORTANT!?\t\t//g' | sed -E 's/[A-Za-z]{4}:\s*//g' | cut -f 5,12 | sort | uniq > 2021-11-26-Dates_and_ISSNs.tsv
echo "The ISSNs and Publication Years can now be found in 2021-11-26-Dates_and_ISSNs.tsv. You're welcome"


# Explanation
# grep -P "\d{4}-\d{4}|\d{4}-\d{3}X" 2021-11-26-Article_list_dirty.tsv 
# - finds each line containing an ISSN (some of which end in X

# sed 's/IMPORTANT!?\t\t//g' 
# removes the nasty mess which ruins the nice order of the columns (the Text "Important", the "!", if it is there, as well as the two tabs responsible for "creating" hte column 

# sed 's/[A-Za-z]{4}:\s*//g' 
# takes out the Text "ISSN" and "issn" as well as the ":" and the spaces ruining the ISSN-column

# cut -f 5,12 
# extracts the columns 5 and 12, that is, ISSN and Year - although unfortunately cut doesn't allow to extact first the year and then the ISSN to match the name of the file - solutions to accomplish this found on the net went beyond the five commands we were to used

# sort 
# sorts (the ISSNs) in order for ...

# uniq 
# to eliminate redundant lines

# > 2021-11-26-Dates_and_ISSNs.tsv
# writes the result to the file

