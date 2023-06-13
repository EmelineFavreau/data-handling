#### Step 1: on HPC; create a directory for this datatype

	ssh username@login-cpu.hpc.cam.ac.uk
	cd data-directory
	mkdir -p $datatype

#### Step 2: on laptop, navigate to USB directory and rename files if spaces or comma exist
`cd ../../Volumes/data-directory`

	# The sort -rz reverses the file order, so that the deepest files in a folder are the first to move and the folder itself will be the last one; thus keeping the path trur
	find . -name "* *" -print0 | sort -rz | while read -d $'\0' f; do mv -v "$f" "$(dirname "$f")/$(basename "${f// /_}")"; done
	find . -name "*,*" -print0 | sort -rz | while read -d $'\0' f; do mv -v "$f" "$(dirname "$f")/$(basename "${f//,/_}")"; done

#### Step 3: create a list of file with 128-bit hash-values for data integrity verification
	for thisdir in $(ls -d *); do
		# list all files names and add the date 
		date > ${thisdir}/$datatype_file_log.txt
		ls ${thisdir}/*.fcs >> ${thisdir}/$datatype_file_log.txt
		# generate md5sum list 
		md5 ${thisdir}/* > ${thisdir}/md5checklist
	done

####  Step 4: copy from USB to HPC directory
	for thisdir in $(ls -d *); do
		# copy onto cluster
		rsync -av -h --progress ${thisdir} username@rds.uis.cam.ac.uk:/path/to/directory/$datatype
	done


####  Step 5: check data integrity on HPC
	# log onto HPC; go to RDS
	ssh username@login-cpu.hpc.cam.ac.uk
	cd data-directory

	# check md5; report only those that aren't OK
	for thisdir in $(ls -d *); do md5sum -c --quiet ${thisdir}/md5checklist; done

	# list number of files and size
	for thisdir in $(ls -d *); do ls -hl ${thisdir}; done > 2023-06-13-current-list.txt

