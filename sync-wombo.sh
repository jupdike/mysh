#!/bin/sh

(cd /Users/jupdike/Dropbox/PhotoPublishing/wombo-art-dream-icons && rm .DS_Store)
(cd /Users/jupdike/Dropbox/PhotoPublishing && ~/bin/s3pub wombo-art-dream-icons s3://updike-org/PhotoPublishing/)
