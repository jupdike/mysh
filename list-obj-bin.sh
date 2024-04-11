# skips Android folders since there are too many of them
find . -type d | grep -v node_modules | grep -v Android | grep -i /bin$
#find . -type d | grep -v node_modules | grep -v Android | grep -i /obj$

